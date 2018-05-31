local res = external_profile("Config/Input/Aircrafts/base_keyboard_binding.lua")
join(res.keyCommands,{

--Communication
{combos = {{key = '\\', reformers = {'RShift'}}},down = iCommandToggleReceiveMode, name = 'Receive Mode', category = 'Communications'},

--Flight Control
{combos = {{key = 'T', reformers = {'LCtrl'}}}, down = iCommandPlaneTrimCancel, name = 'Trim Reset', category = 'Flight Control'},

-- Alphajet
{combos = {{key = "F", reformers = {"LShift"}}}, down = iCommandPlaneFlapsOn, name = "Flaps Landing Position", category = "Systems"},
{combos = {{key = "F", reformers = {"LCtrl"}}}, down = iCommandPlaneFlapsOff, name = "Flaps Up", category = "Systems"},
{combos = {{key = "F"}}, down = iCommandPlaneFlaps, name = "Flaps Fully Down", category = "Systems"},
{combos = {{key = 'T', reformers = {'LCtrl'}}}, down = iCommandPlaneTrimCancel, name = 'Trim Reset', category = 'Flight Control'},

{combos = {{key = "B"}}, down = iCommandPlaneAirBrake, name = "Airbrake", category = "Systems"},
{combos = {{key = "B", reformers = {"LCtrl"}}}, down = iCommandPlaneAirBrakeOff, name = "Airbrake Off", category = "Systems"},
{combos = {{key = "B", reformers = {"LShift"}}}, down = iCommandPlaneAirBrakeOn, name = "Airbrake On", category = "Systems"},

-- Autopilot
{combos = {{key = 'A'}}						 ,down = iCommandPlaneAutopilot, name    		= 'LAAP Engage/Disengage'     , category = 'LASTE Control Panel'},
{combos = {{key = '1', reformers = {'LAlt'}}},down = iCommandPlaneStabPathHold, name 		= 'LAAP Path Hold'			  , category = 'LASTE Control Panel'},
{combos = {{key = '2', reformers = {'LAlt'}}},down = iCommandPlaneStabHbarHeading, name 	= 'LAAP Altitude/Heading Hold', category = 'LASTE Control Panel'},
{combos = {{key = '3', reformers = {'LAlt'}}},down = iCommandPlaneStabHbarBank, name 		= 'LAAP Altitude/Bank Hold'   , category = 'LASTE Control Panel'},
{combos = {{key = '4', reformers = {'LAlt'}}},down = iCommandPlane_EAC_ARM, name = 'EAC Arm', category = 'LASTE Control Panel'},
{combos = {{key = '5', reformers = {'LAlt'}}},down = iCommandPlane_EAC_OFF, name = 'EAC Off', category = 'LASTE Control Panel'},

-- Systems
{combos = {{key = 'R'}}, down = iCommandPlaneFuelOn, up = iCommandPlaneFuelOff, name = 'Fuel Dump', category = 'Systems'},
{combos = {{key = 'R', reformers = {'LCtrl'}}}, down = iCommandPlaneAirRefuel, name = 'Refueling Boom', category = 'Systems'},
{combos = {{key = 'C', reformers = {'LCtrl'}}}, down = iCommandPlaneFonar, name = _('Canopy Open/Close'), category = _('Systems')},
--{combos = {{key = 'R', reformers = {'LAlt'}}}, down = iCommandPlaneJettisonFuelTanks, name = 'Jettison Fuel Tanks', category = 'Systems'},

-- Modes
--{combos = {{key = '2'}}, down = iCommandPlaneModeBVR, name = '(2) Beyond Visual Range Mode', category = 'Modes'},
--{combos = {{key = '3'}}, down = iCommandPlaneModeVS, name = '(3) Close Air Combat Vertical Scan Mode', category = 'Modes'},
--{combos = {{key = '4'}}, down = iCommandPlaneModeBore, name = '(4) Close Air Combat Bore Mode', category = 'Modes'},
--{combos = {{key = '5'}}, down = iCommandPlaneModeHelmet, name = '(5) Close Air Combat HMD Helmet Mode', category = 'Modes'},
{combos = {{key = '6'}}, down = iCommandPlaneModeFI0, name = '(6) Longitudinal Missile Aiming Mode', category = 'Modes'},
{combos = {{key = '7'}}, down = iCommandPlaneModeGround, name = '(7) Air-To-Ground Mode', category = 'Modes'},
--{combos = {{key = '8'}}, down = iCommandPlaneModeGrid, name = '(8) Gunsight Reticle Switch', category = 'Modes'},

-- Sensors
{combos = {{key = 'Enter'}}, down = iCommandPlaneChangeLock, up = iCommandPlaneChangeLockUp, name = 'Target Lock', category = 'Sensors'},
{combos = {{key = 'Back'}}, down = iCommandSensorReset, name = 'Target Unlock', category = 'Sensors'},
--{combos = {{key = 'I'}}, down = iCommandPlaneRadarOnOff, name = 'Radar On/Off', category = 'Sensors'},
--{combos = {{key = 'I', reformers = {'RAlt'}}}, down = iCommandPlaneRadarChangeMode, name = 'Radar RWS/TWS Mode Select', category = 'Sensors'},
{combos = {{key = 'I', reformers = {'RCtrl'}}}, down = iCommandPlaneRadarCenter, name = 'Target Designator To Center', category = 'Sensors'},
--{combos = {{key = 'I', reformers = {'RShift'}}}, down = iCommandPlaneChangeRadarPRF, name = 'Radar Pulse Repeat Frequency Select', category = 'Sensors'},
{combos = {{key = 'O'}}, down = iCommandPlaneEOSOnOff, name = 'CCRP steering mode', category = 'Sensors'},
--{combos = {{key = 'O', reformers = {'RShift'}}}, down = iCommandPlaneLaserRangerOnOff, name = 'Laser Ranger On/Off', category = 'Sensors'},
--{combos = {{key = 'O', reformers = {'RCtrl'}}}, down = iCommandPlaneNightTVOnOff, name = 'Night Vision (FLIR or LLTV) On/Off', category = 'Sensors'},
{combos = {{key = ';'}}, pressed = iCommandPlaneRadarUp, up = iCommandPlaneRadarStop, name = 'Target Designator Up', category = 'Sensors'},
{combos = {{key = '.'}}, pressed = iCommandPlaneRadarDown, up = iCommandPlaneRadarStop, name = 'Target Designator Down', category = 'Sensors'},
{combos = {{key = ','}}, pressed = iCommandPlaneRadarLeft, up = iCommandPlaneRadarStop, name = 'Target Designator Left', category = 'Sensors'},
{combos = {{key = '/'}}, pressed = iCommandPlaneRadarRight, up = iCommandPlaneRadarStop, name = 'Target Designator Right', category = 'Sensors'},
--{combos = {{key = ';', reformers = {'RShift'}}}, pressed = iCommandSelecterUp, up = iCommandSelecterStop, name = 'Scan Zone Up', category = 'Sensors'},
--{combos = {{key = '.', reformers = {'RShift'}}}, pressed = iCommandSelecterDown, up = iCommandSelecterStop, name = 'Scan Zone Down', category = 'Sensors'},
--{combos = {{key = ',', reformers = {'RShift'}}}, pressed = iCommandSelecterLeft, up = iCommandSelecterStop, name = 'Scan Zone Left', category = 'Sensors'},
--{combos = {{key = '/', reformers = {'RShift'}}}, pressed = iCommandSelecterRight, up = iCommandSelecterStop, name = 'Scan Zone Right', category = 'Sensors'},
{combos = {{key = '='}}, down = iCommandPlaneZoomIn, name = 'Display Zoom In', category = 'Sensors'},
{combos = {{key = '-'}}, down = iCommandPlaneZoomOut, name = 'Display Zoom Out', category = 'Sensors'},
--{combos = {{key = '-', reformers = {'RCtrl'}}}, down = iCommandDecreaseRadarScanArea, name = 'Radar Scan Zone Decrease', category = 'Sensors'},
--{combos = {{key = '=', reformers = {'RCtrl'}}}, down = iCommandIncreaseRadarScanArea, name = 'Radar Scan Zone Increase', category = 'Sensors'},
--{combos = {{key = '=', reformers = {'RAlt'}}}, pressed = iCommandPlaneIncreaseBase_Distance, up = iCommandPlaneStopBase_Distance, name = 'Target Specified Size Increase', category = 'Sensors'},
--{combos = {{key = '-', reformers = {'RAlt'}}}, pressed = iCommandPlaneDecreaseBase_Distance, up = iCommandPlaneStopBase_Distance, name = 'Target Specified Size Decrease', category = 'Sensors'},
{combos = {{key = 'R', reformers = {'RShift'}}}, down = iCommandChangeRWRMode, name = 'RWR/SPO Mode Select', category = 'Sensors'},
{combos = {{key = ',', reformers = {'RAlt'}}}, down = iCommandPlaneThreatWarnSoundVolumeDown, name = 'RWR/SPO Sound Signals Volume Down', category = 'Sensors'},
{combos = {{key = '.', reformers = {'RAlt'}}}, down = iCommandPlaneThreatWarnSoundVolumeUp, name = 'RWR/SPO Sound Signals Volume Up', category = 'Sensors'},

-- Weapons                                                                        
{combos = {{key = 'V', reformers = {'LCtrl'}}}, down = iCommandPlaneSalvoOnOff, name = 'Salvo Mode', category = 'Weapons'},
{combos = {{key = 'Space', reformers = {'RAlt'}}}, down = iCommandPlanePickleOn,	up = iCommandPlanePickleOff, name = 'Weapon Release', category = 'Weapons'},
--{combos = {{key = 'C', reformers = {'LShift'}}}, down = iCommandChangeGunRateOfFire, name = 'Cannon Rate Of Fire / Cut Of Burst select', category = 'Weapons'},
{combos = {{key = 'Space', reformers = {'LCtrl'}}}, down = iCommandChangeRippleQuantity, name = 'Ripple Quantity Select', category = 'Weapons'},
{combos = {{key = 'V'}}, down = iCommandChangeRippleInterval, name = 'Ripple Interval Increase', category = 'Weapons'},
{combos = {{key = 'V', reformers = {'LShift'}}}, down = iCommandChangeRippleIntervalDown, name = 'Ripple Interval Decrease', category = 'Weapons'},
{combos = {{key = 'Space', reformers = {'LShift'}}}, down = iCommandChangeReleaseMode, name = 'PRS/SGL Release Submodes Cycle', category = 'Weapons'},
})
return res
