local dev = GetSelf()

--debug_output_file = io.open("./Avionics.log", "wa")
--debug_output_file:write("var "..var.."\r\n")

local update_time_step = 0.1
make_default_activity(update_time_step)
local sensor_data = get_base_data()

-- Const
local degrees_per_radian = 57.2957795
local feet_per_meter_per_minute = 196.8

-- Variables
local DC_BUS_V  = get_param_handle("DC_BUS_V")
local ias = get_param_handle("D_IAS")
local LIB_IAS_LOW = get_param_handle("LIB_IAS_LOW")
local LIB_IAS_HIGH = get_param_handle("LIB_IAS_HIGH")
local mach = get_param_handle("D_MACH")
local AOA = get_param_handle("D_AOA")
local hdg = get_param_handle("D_HDG")
local vv = get_param_handle("D_VV")
local altitude_source = get_param_handle("ALT_SOURCE")
local altitude = get_param_handle("D_ALT")
local RPMG = get_param_handle("D_RPMG")
local RPMD = get_param_handle("D_RPMD")
local LIB_RPM = get_param_handle("LIB_RPM")
local LIB_RPMPC = get_param_handle("LIB_RPMPC")
local test = get_param_handle("D_TEST")
local HUD_PITCH = get_param_handle("HUD_PITCH")

local L_VD_G = get_param_handle("L_VD_G")
local L_VD_D = get_param_handle("L_VD_D")
local ELEC_P2 = get_param_handle("ELEC_P2")
local FLAPSPOS = get_param_handle("FLAPSPOS")
local LIB_FLAPS = get_param_handle("LIB_FLAPS")
local GHP = get_param_handle("GHP")

local ThrottleLeft = get_param_handle("ThrottleLeft")
local ThrottleRight = get_param_handle("ThrottleRight")

local GEAR_NOSE = get_param_handle("GEAR_NOSE")
local GEAR_LEFT = get_param_handle("GEAR_LEFT")
local GEAR_RIGHT = get_param_handle("GEAR_RIGHT")
local LIB_GEAR = get_param_handle("LIB_GEAR")

local hour = get_param_handle("hour")
local minute = get_param_handle("minute")
local seconde = get_param_handle("seconde")
local jour = get_param_handle("jour")
local ChronoH = get_param_handle("ChronoH")
local ChronoM = get_param_handle("ChronoM")
local ChronoS = get_param_handle("ChronoS")
local boucle = 0
local old_S = 0
local ChronoStart = 0
local trim = get_param_handle("trim")

-- Initialisation
DC_BUS_V:set(0)
mach:set(0.0)
AOA:set(0.0)
ias:set(0.0)
LIB_IAS_LOW:set("LOW")
LIB_IAS_HIGH:set("")
hdg:set(0.0)
vv:set(0.0)
altitude:set(0.0)
RPMG:set(0.0)
RPMD:set(0.0)
test:set(0.0)
L_VD_G:set(0.0)
L_VD_D:set(0.0)
FLAPSPOS:set(0.0)
ChronoH:set(0)
ChronoM:set(0)
ChronoS:set(0)

function post_initialize()
	electric_system = GetDevice(3) --devices["ELECTRIC_SYSTEM"]
	-- print("post_initialize called")
end

function SetCommand(command,value)
	if command == 3001 then  -- Reset
		if tonumber(ChronoStart) == 0 then -- arreté donc on demarre
			ChronoStart = 2
			ChronoH:set(0)
			ChronoM:set(0)
			ChronoS:set(0)
		else
			if tonumber(ChronoStart) == 1 then -- pause donc on reset
				ChronoStart = 0
				ChronoH:set(0)
				ChronoM:set(0)
				ChronoS:set(0)
			end
			if tonumber(ChronoStart) == 2 then -- tourne donc on pause
				ChronoStart = 1
			end
		end
	end
end

function update()
	boucle = boucle + 1
	
	local val = 0
	local H = os.date("%H")
	local M = os.date("%M")
	local S = os.date("%S")
	local D = os.date("%d")
	local CH = tonumber(ChronoH:get())
	local CM = tonumber(ChronoM:get())
	local CS = tonumber(ChronoS:get())
	
	jour:set(D)
	
	if tonumber(H) > 11 then
		H = tonumber(H) - 12
	end
	
	val = tonumber(H) * 3600
	val = val + (tonumber(M) * 60)
	val = val + tonumber(S)
	val = val / 120
	hour:set(val)

	val = tonumber(M) * 60
	val = val + tonumber(S)
	val = val / 10
	minute:set(val)	
	
	-- on remet boucle a zéro si changement de seconde
	if tonumber(old_S) ~= tonumber(S) then 
		old_S = S
		boucle = 0
	end
	
	val = tonumber(S)
	val = val + (tonumber(boucle) / 10)
	val = val * 6
	seconde:set(val)

	if tonumber(ChronoStart) == 2 then
		if boucle == 0 then 
			CS = CS + 1
			if CS == 60 then
				CM = CM + 1
				CS = 0
				if CM == 60 then
					CH = CH + 1
					CM = 0
				end
			end
		end
	end
	CH = string.format("%2d", CH)
	CM = string.format("%2d", CM)
	CS = string.format("%2d", CS)
	ChronoH:set(CH)
	ChronoM:set(CM)
	ChronoS:set(CS)
	
	GEAR_NOSE:set(sensor_data.getNoseLandingGearDown())
	GEAR_LEFT:set(sensor_data.getLeftMainLandingGearDown())
	GEAR_RIGHT:set(sensor_data.getRightMainLandingGearDown())

	if GEAR_NOSE:get() == 1 then
		LIB_GEAR:set("GEAR")
	else
		LIB_GEAR:set("")
	end
	
	ias:set(sensor_data.getIndicatedAirSpeed()*1.9438444924574)
	
	local nIAS = tonumber(ias:get())

	if nIAS >= 130 then
		LIB_IAS_LOW:set("")
		LIB_IAS_HIGH:set("IAS")
	else
		if nIAS < 130 and nIAS > 50 then
			LIB_IAS_LOW:set("IAS")
			LIB_IAS_HIGH:set("")
		else
			LIB_IAS_LOW:set("LOW")
			LIB_IAS_HIGH:set("")
		end
	end	

	mach:set(sensor_data.getMachNumber())
	AOA:set(sensor_data.getAngleOfAttack()*degrees_per_radian)
	hdg:set(360-(sensor_data.getHeading()*degrees_per_radian))
	vv:set(sensor_data.getVerticalVelocity()*feet_per_meter_per_minute)
	RPMG:set(sensor_data.getEngineLeftRPM())
	RPMD:set(sensor_data.getEngineRightRPM())
	
	local RPMPC = tonumber(RPMG:get())
	
	if RPMPC < 90 then  -- vert
		LIB_RPM:set(string.format("%.1f%%", RPMPC))
		LIB_RPMPC:set(" ")
	else
		if RPMPC < 99.9 then  -- entre 90 et 100   jaune 
			LIB_RPM:set(string.format("%.1f%%", RPMPC))
			LIB_RPMPC:set(string.format("%.1f%%", RPMPC))
		else  -- sup à 100   r
			LIB_RPM:set(" ")
			LIB_RPMPC:set(string.format("%.1f%%", RPMPC))
		end
	end
	
	HUD_PITCH:set(3)
	
--	debug_output_file:write("Pitch : "..HrzPitch:get().."\r\n")
	--HUD_PITCH:set(sensor_data.getRoll())
		
	FLAPSPOS:set(sensor_data.getFlapsPos())
	
	if FLAPSPOS:get() > 0 then
		LIB_FLAPS:set("FLAPS")
	else
		LIB_FLAPS:set(" ")
	end
	
	GHP:set(sensor_data.getLandingGearHandlePos())
	
	-- Altitude
	local barometric_altitude = sensor_data.getBarometricAltitude()*3.28084
	local radar_altitude = sensor_data.getRadarAltitude()*3.28084
	
	if radar_altitude > 495 then
		altitude:set(barometric_altitude)
		altitude_source:set("B")
	else
		altitude:set(radar_altitude)
		altitude_source:set("R")
	end
	
	-- Light Vanne Decharge
	if RPMG:get() > 5 and RPMG:get() < 80 and ELEC_P2:get() == 1 then
		L_VD_G:set(1)
	else
		L_VD_G:set(0)
	end
	
	if RPMD:get() > 5 and RPMD:get() < 80 and ELEC_P2:get() == 1 then
		L_VD_D:set(1)
	else
		L_VD_D:set(0)
	end
	
	if RPMD:get() > 100 then
	
	else
	
	end	
	
	-- Dinosaur electric system
	if electric_system ~= nil then
	   local DC_V     =  electric_system:get_DC_Bus_1_voltage()
	   local prev_val =  DC_BUS_V:get()
	   -- add some dynamic: 
	   DC_V = prev_val + (DC_V - prev_val) * update_time_step   
	   DC_BUS_V:set(DC_V)
	end	
end

need_to_be_closed = false -- close lua state after initialization

-- getAngleOfAttack
-- getAngleOfSlide
-- getBarometricAltitude
-- getCanopyPos
-- getCanopyState
-- getEngineLeftFuelConsumption --
-- getEngineLeftRPM
-- getEngineLeftTemperatureBeforeTurbine
-- getEngineRightFuelConsumption
-- getEngineRightRPM
-- getEngineRightTemperatureBeforeTurbine
-- getFlapsPos
-- getFlapsRetracted
-- getHeading
-- getHelicopterCollective
-- getHelicopterCorrection
-- getHorizontalAcceleration
-- getIndicatedAirSpeed
-- getLandingGearHandlePos
-- getLateralAcceleration
-- getLeftMainLandingGearDown
-- getLeftMainLandingGearUp
-- getMachNumber
-- getMagneticHeading
-- getNoseLandingGearDown
-- getNoseLandingGearUp
-- getPitch
-- getRadarAltitude
-- getRateOfPitch
-- getRateOfRoll
-- getRateOfYaw
-- getRightMainLandingGearDown
-- getRightMainLandingGearUp
-- getRoll
-- getRudderPosition --
-- getSpeedBrakePos
-- getStickPitchPosition
-- getStickRollPosition
-- getThrottleLeftPosition
-- getThrottleRightPosition
-- getTotalFuelWeight  
-- getTrueAirSpeed
-- getVerticalAcceleration
-- getVerticalVelocity
-- getWOW_LeftMainLandingGear
-- getWOW_NoseLandingGear
-- getWOW_RightMainLandingGear



