local dev 	    = GetSelf()

--debug_output_file = io.open("./Systems.log", "wa")
--debug_output_file:write("Démarrage Systems\r\n")

local update_time_step = 0.032 --0.1
make_default_activity(update_time_step) --update will be called 10 times per second

local AircraftIsOnGround = get_param_handle("AircraftIsOnGround")

-- Variables
local L_COCKPIT = get_param_handle("L_COCKPIT")
local LIB_COCKPIT = get_param_handle("LIB_COCKPIT")
local CANOPY_STATUS = get_param_handle("CANOPY_STATUS")
local CANOPY_COMMAND = get_param_handle("CANOPY_COMMAND")

local CockpitOnOff 		= 71
local CockpitIsOpen 	= 0
local CANOPYSTATUS		= 0
local Verriere 			= 3069
local nPas				= 0.01 --0.02

CANOPY_STATUS:set(0.0)
CANOPY_COMMAND:set(0)
LIB_COCKPIT:set("")

-- Initialisation
dev:listen_command(CockpitOnOff)
dev:listen_command(Verriere)

function SetCommand(command,value)			
	-- CANOPY
	if command == CockpitOnOff or command == Verriere then
		if (CockpitIsOpen == 1) then
			CANOPY_COMMAND:set(1)
			CockpitIsOpen = 0
		else
			CANOPY_COMMAND:set(0)
			CockpitIsOpen = 1
		end
	end	
end

function update()
	L_COCKPIT:set(CockpitIsOpen)
	if AircraftIsOnGround:get() > 0.5 then
		if L_COCKPIT:get() == 1 then
			LIB_COCKPIT:set("Open")
			--OPEN instruction
			if CANOPYSTATUS < 0.899 then
				CANOPYSTATUS = CANOPYSTATUS + nPas
			else
				CANOPYSTATUS = CANOPYSTATUS
			end
		else
			LIB_COCKPIT:set("")
			--CLOSE instruction
			if CANOPYSTATUS > 0 then
				CANOPYSTATUS = CANOPYSTATUS - nPas
			else
				CANOPYSTATUS = CANOPYSTATUS
			end
		end	
		
		CANOPY_STATUS:set(CANOPYSTATUS)
		
		set_aircraft_draw_argument_value(38,CANOPYSTATUS)	
	end
end

need_to_be_closed = false -- close lua state after initialization
