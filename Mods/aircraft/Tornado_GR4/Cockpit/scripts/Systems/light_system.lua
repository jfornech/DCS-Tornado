local dev = GetSelf()

--debug_output_file = io.open("./Light.log", "wa")
--debug_output_file:write("Démarrage Light\r\n")

local update_time_step = 0.1
make_default_activity(update_time_step) 
local sensor_data = get_base_data()

local T_NAVLIGHT = get_param_handle("T_NAVLIGHT")
local T_STROBELIGHT = get_param_handle("T_STROBELIGHT")
local T_FORMLIGHT = get_param_handle("T_FORMLIGHT")
local T_LANDINGLIGHT = get_param_handle("T_LANDINGLIGHT")
local L_LandSwitch = get_param_handle("L_LandSwitch")
local L_LandSwitchHelios = get_param_handle("L_LandSwitchHelios")
local L_LandHelios = get_param_handle("L_LandHelios")
local L_PhareNez = get_param_handle("L_PhareNez")
local L_PhareG = get_param_handle("L_PhareG")
--local L_PhareD = get_param_handle("L_PhareD")

local NavLight = 3001
local StrobeLight  = 3004 -- This is the number of the command from command_defs
local FormationLight = 3002
local LandingLight = 3006

local NavLightSwitch = 3001
local StrobeLightSwitch = 502
local FormLightSwitch = 503
local LandLightSwitch = 504

NavLightSwitchIsOn = 0
StrobeLightSwitchIsOn = 0
FormLightSwitchIsOn = 0
LandLightSwitchIsOn = 0
L_LandSwitch:set(-1)
L_LandSwitchHelios:set(0)
L_PhareNez:set(0)
L_PhareG:set(0)
--L_PhareD:set(0)

dev:listen_command(NavLightSwitch)
dev:listen_command(FormationLightSwitch)
dev:listen_command(StrobeLightSwitch)
dev:listen_command(LandLightSwitch)

T_NAVLIGHT:set(0)
T_STROBELIGHT:set(0)
T_FORMLIGHT:set(0)
T_LANDINGLIGHT:set(0)

function SetCommand(command,value)	
	if command == NavLight or command == NavLightSwitch then
		if (NavLightSwitchIsOn == 1) then
			NavLightSwitchIsOn = 0
		else
			NavLightSwitchIsOn = 1
		end
	end
		
	if command == StrobeLight or command == StrobeLightSwitch then
		if (StrobeLightSwitchIsOn == 1) then
			StrobeLightSwitchIsOn = 0
		else
			StrobeLightSwitchIsOn = 1
		end
	end
	
	if command == FormationLight then
		if (FormLightSwitchIsOn == 1) then
			FormLightSwitchIsOn = 0
		else
			FormLightSwitchIsOn = 1
		end
	end
	
--	debug_output_file:write("Light : "..command.." , "..L_LandSwitch:get().." , "..L_LandHelios:get().." , "..value.."\r\n")
--	if command == LandingLight then
--		if value == -1 then
--			L_PhareNez:set(0)
--			L_PhareG:set(0)
--			--L_PhareD:set(0)
--		end
--		if value == 0 then
--			L_PhareNez:set(1)
--			L_PhareG:set(0)
--			--L_PhareD:set(0)
--		end
--		if value == 1 then
--			L_PhareNez:set(1)
--			L_PhareG:set(1)
--			--L_PhareD:set(1)
--		end
-- end

	if LandLightSwitchIsOn == 1 then
		LandLightSwitchIsOn = 0
		L_LandSwitch:set(1)
		L_LandHelios:set(0)
	else
		LandLightSwitchIsOn = 1
		L_LandSwitch:set(0)
		L_LandHelios:set(1)
	end
end

function update()

	if (NavLightSwitchIsOn == 1) then
		T_NAVLIGHT:set(1)
	else
		T_NAVLIGHT:set(0)
	end
	
	if (StrobeLightSwitchIsOn == 1) then
		T_STROBELIGHT:set(1)
	else
		T_STROBELIGHT:set(0)
	end
	
	if (FormLightSwitchIsOn == 1) then
		T_FORMLIGHT:set(1)
	else
		T_FORMLIGHT:set(0)
	end
	
	if (LandLightSwitchIsOn == 1) then
		T_LANDINGLIGHT:set(1)
	else
		T_LANDINGLIGHT:set(0)
	end
	
	set_aircraft_draw_argument_value(190,NavLightSwitchIsOn)
	set_aircraft_draw_argument_value(191,NavLightSwitchIsOn)
	set_aircraft_draw_argument_value(203,NavLightSwitchIsOn)
	
	set_aircraft_draw_argument_value(195,StrobeLightSwitchIsOn)
	set_aircraft_draw_argument_value(196,StrobeLightSwitchIsOn)
	set_aircraft_draw_argument_value(192,StrobeLightSwitchIsOn)
	
	set_aircraft_draw_argument_value(202,FormLightSwitchIsOn)
	set_aircraft_draw_argument_value(201,FormLightSwitchIsOn)
	
	--set_aircraft_draw_argument_value(208,L_PhareNez:get())
	--set_aircraft_draw_argument_value(209,L_PhareG:get())
	--set_aircraft_draw_argument_value(130,L_PhareD:get())
	set_aircraft_draw_argument_value(209,LandLightSwitchIsOn)
	set_aircraft_draw_argument_value(130,LandLightSwitchIsOn)
		
end


	--if ( command == LandingLight or command == LandLightSwitch ) then
	--	if LandLightSwitchIsOn == 1 then
	--		LandLightSwitchIsOn = 0
	--		L_LandSwitch:set(1)
	--		L_Land:set(0)
	--	else
	--		LandLightSwitchIsOn = 1
	--		L_LandSwitch:set(0)
	--		L_Land:set(1)
	--	end
	--end