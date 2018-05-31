local dev 	    = GetSelf()

--local var = "./CoreMods/aircraft/Alphajet/Alphajet.lua"

local update_time_step = 0.1
make_default_activity(update_time_step) --update will be called 10 times per second

local sensor_data = get_base_data()
local alti = sensor_data.getRadarAltitude()*3.28084
local AircraftIsOnGround = get_param_handle("AircraftIsOnGround")

-- Variables
local L_SMOKE 	= get_param_handle("L_SMOKE")
local LIB_SMOKE = get_param_handle("LIB_SMOKE")

local SmokeOnOff 		= 78
local SmokeIsOn 		= 0

-- Initialisation
dev:listen_command(SmokeOnOff)

function SetCommand(command,value)			
	-- Smoke Light System Listening
	if command == SmokeOnOff then --and AircraftIsOnGround:get() < 0.5 then
		if (SmokeIsOn == 1) then
			SmokeIsOn = 0
		else
			SmokeIsOn = 1
		end
	end
end

function update()
	-- Smoke Light System Listening
	L_SMOKE:set(SmokeIsOn)
	if L_SMOKE:get() == 1 then
		LIB_SMOKE:set("SMOKE")
	else
		LIB_SMOKE:set("")
	end	

end

need_to_be_closed = false -- close lua state after initialization
