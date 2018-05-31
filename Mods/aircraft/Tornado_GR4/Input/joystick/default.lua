local res = external_profile("Config/Input/Aircrafts/base_joystick_binding.lua")
join(res.keyCommands,{

-- Alphajet
{combos = {{key = "F", reformers = {"LShift"}}}, down = iCommandPlaneFlapsOn, name = "Flaps Landing Position", category = "Systems"},
{combos = {{key = "F", reformers = {"LCtrl"}}}, down = iCommandPlaneFlapsOff, name = "Flaps Up", category = "Systems"},
{combos = {{key = "F"}}, down = iCommandPlaneFlaps, name = "Flaps Mid", category = "Systems"},

{combos = {{key = "B"}}, down = iCommandPlaneAirBrake, name = "Airbrake", category = "Systems"},
{combos = {{key = "B", reformers = {"LCtrl"}}}, down = iCommandPlaneAirBrakeOff, name = "Airbrake Off", category = "Systems"},
{combos = {{key = "B", reformers = {"LShift"}}}, down = iCommandPlaneAirBrakeOn, name = "Airbrake On", category = "Systems"},

-- Autopilot
{down = iCommandPlaneAutopilot, name    		= 'LAAP Engage/Disengage'     , category = 'LASTE Control Panel'},
{down = iCommandPlaneStabPathHold, name 		= 'LAAP Path Hold'			  , category = 'LASTE Control Panel'},
{down = iCommandPlaneStabHbarHeading, name 		= 'LAAP Altitude/Heading Hold', category = 'LASTE Control Panel'},
{down = iCommandPlaneStabHbarBank, name 		= 'LAAP Altitude/Bank Hold'   , category = 'LASTE Control Panel'},
{down = iCommandPlane_EAC_ARM, name = 'EAC Arm', category = 'LASTE Control Panel'},
{down = iCommandPlane_EAC_OFF, name = 'EAC Off', category = 'LASTE Control Panel'},

-- Systems
{down = iCommandPlaneAirRefuel, name = 'Refueling Bay', category = 'Systems'},
--{down = iCommandPlaneJettisonFuelTanks, name = 'Jettison Fuel Tanks', category = 'Systems'},
-- Modes
--{down = iCommandPlaneModeBVR, name = '(2) Beyond Visual Range Mode', category = 'Modes'},
--{down = iCommandPlaneModeVS, name = '(3) Close Air Combat Vertical Scan Mode', category = 'Modes'},
--{down = iCommandPlaneModeBore, name = '(4) Close Air Combat Bore Mode', category = 'Modes'},
--{down = iCommandPlaneModeHelmet, name = '(5) Close Air Combat HMD Helmet Mode', category = 'Modes'},
{down = iCommandPlaneModeFI0, name = '(6) Longitudinal Missile Aiming Mode', category = 'Modes'},
{down = iCommandPlaneModeGround, name = '(7) Air-To-Ground Mode', category = 'Modes'},
--{down = iCommandPlaneModeGrid, name = '(8) Gunsight Reticle Switch', category = 'Modes'},

-- Sensors
{combos = {{key = 'JOY_BTN3'}}, down = iCommandPlaneChangeLock, up = iCommandPlaneChangeLockUp, name = 'Target Lock', category = 'Sensors'},
{down = iCommandSensorReset, name = 'Target Unlock', category = 'Sensors'},
--{down = iCommandPlaneRadarOnOff, name = 'Radar On/Off', category = 'Sensors'},
--{down = iCommandPlaneRadarChangeMode, name = 'Radar RWS/TWS Mode Select', category = 'Sensors'},
{down = iCommandPlaneRadarCenter, name = 'Target Designator To Center', category = 'Sensors'},
--{down = iCommandPlaneChangeRadarPRF, name = 'Radar Pulse Repeat Frequency Select', category = 'Sensors'},
{down = iCommandPlaneEOSOnOff, name = 'CCRP steering mode', category = 'Sensors'},
--{down = iCommandPlaneLaserRangerOnOff, name = 'Laser Ranger On/Off', category = 'Sensors'},
--{down = iCommandPlaneNightTVOnOff, name = 'Night Vision (FLIR or LLTV) On/Off', category = 'Sensors'},
{pressed = iCommandPlaneRadarUp, up = iCommandPlaneRadarStop, name = 'Target Designator Up', category = 'Sensors'},
{pressed = iCommandPlaneRadarDown, up = iCommandPlaneRadarStop, name = 'Target Designator Down', category = 'Sensors'},
{pressed = iCommandPlaneRadarLeft, up = iCommandPlaneRadarStop, name = 'Target Designator Left', category = 'Sensors'},
{pressed = iCommandPlaneRadarRight, up = iCommandPlaneRadarStop, name = 'Target Designator Right', category = 'Sensors'},
--{pressed = iCommandSelecterUp, up = iCommandSelecterStop, name = 'Scan Zone Up', category = 'Sensors'},
--{pressed = iCommandSelecterDown, up = iCommandSelecterStop, name = 'Scan Zone Down', category = 'Sensors'},
--{pressed = iCommandSelecterLeft, up = iCommandSelecterStop, name = 'Scan Zone Left', category = 'Sensors'},
--{pressed = iCommandSelecterRight, up = iCommandSelecterStop, name = 'Scan Zone Right', category = 'Sensors'},
{down = iCommandPlaneZoomIn, name = 'Display Zoom In', category = 'Sensors'},
{down = iCommandPlaneZoomOut, name = 'Display Zoom Out', category = 'Sensors'},
{down = iCommandPlaneLaunchPermissionOverride, name = 'Launch Permission Override', category = 'Sensors'},
--{down = iCommandDecreaseRadarScanArea, name = 'Radar Scan Zone Decrease', category = 'Sensors'},
--{down = iCommandIncreaseRadarScanArea, name = 'Radar Scan Zone Increase', category = 'Sensors'},
--{pressed = iCommandPlaneIncreaseBase_Distance, up = iCommandPlaneStopBase_Distance, name = 'Target Specified Size Increase', category = 'Sensors'},
--{pressed = iCommandPlaneDecreaseBase_Distance, up = iCommandPlaneStopBase_Distance, name = 'Target Specified Size Decrease', category = 'Sensors'},
{down = iCommandChangeRWRMode, name = 'RWR/SPO Mode Select', category = 'Sensors'},
{down = iCommandPlaneThreatWarnSoundVolumeDown, name = 'RWR/SPO Sound Signals Volume Down', category = 'Sensors'},
{down = iCommandPlaneThreatWarnSoundVolumeUp, name = 'RWR/SPO Sound Signals Volume Up', category = 'Sensors'},

-- Weapons                                                                        
{down = iCommandPlaneSalvoOnOff, name = 'Salvo Mode', category = 'Weapons'},
{combos = {{key = 'JOY_BTN2'}}, down = iCommandPlanePickleOn,	up = iCommandPlanePickleOff, name = 'Weapon Release', category = 'Weapons'},
--{down = iCommandChangeGunRateOfFire, name = 'Cannon Rate Of Fire / Cut Of Burst select', category = 'Weapons'},
{down = iCommandChangeRippleQuantity, name = 'Ripple Quantity Select', category = 'Weapons'},
{down = iCommandChangeRippleInterval, name = 'Ripple Interval Increase', category = 'Weapons'},
{down = iCommandChangeRippleIntervalDown, name = 'Ripple Interval Decrease', category = 'Weapons'},
{down = iCommandChangeReleaseMode, name = 'PRS/SGL Release Submodes Cycle', category = 'Weapons'},
})
-- joystick axes 
join(res.axisCommands,{
{action = iCommandPlaneSelecterHorizontalAbs, name = 'TDC Slew Horizontal'},
{action = iCommandPlaneSelecterVerticalAbs	, name = 'TDC Slew Vertical'},
--{action = iCommandPlaneRadarHorizontalAbs	, name = 'Radar Horizontal'},
--{action = iCommandPlaneRadarVerticalAbs		, name = 'Radar Vertical'},

--{action = iCommandPlaneMFDZoomAbs 			, name = 'MFD Range'},
--{action = iCommandPlaneBase_DistanceAbs 	, name = 'Base/Distance'},
{action = iCommandPlaneTrimPitchAbs, name = "Trim Elevator"},
{action = iCommandPlaneTrimRollAbs, name = 'Trim Aileron'},
})
return res