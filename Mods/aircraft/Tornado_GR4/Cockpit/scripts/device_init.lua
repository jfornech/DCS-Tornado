mount_vfs_texture_archives("Bazar/Textures/AvionicsCommon")

dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.common_script_path.."tools.lua")

layoutGeometry = {}
			
MainPanel = {"ccMainPanel",LockOn_Options.script_path.."mainpanel_init.lua"}
			 
creators    = {}
creators[devices.AVIONICS]		 = {"avLuaDevice"		    ,LockOn_Options.script_path.."Systems/avionics.lua"}
creators[devices.WEAPON_SYSTEM]	 = {"avSimpleWeaponSystem"  ,LockOn_Options.script_path.."Systems/weapon_system.lua"}
creators[devices.ELECTRIC_SYSTEM]= {"avSimpleElectricSystem",LockOn_Options.script_path.."Systems/electric_system.lua"}
creators[devices.CLOCK]			 = {"avAChS_1"			    ,LockOn_Options.script_path.."clock.lua"}
creators[devices.ADI]			 = {"avBaseIKP"			    ,LockOn_Options.script_path.."adi.lua"}
creators[devices.ALTIMETER]		 = {"avLuaDevice"			,LockOn_Options.script_path.."Altimeter/altimeter.lua"}
creators[devices.ACCELEROMETER]	 = {"avLuaDevice"			,LockOn_Options.script_path.."Accelerometer/accelerometer.lua"}
creators[devices.COMMANDS]	 	= {"avLuaDevice"			,LockOn_Options.script_path.."Systems/commands.lua"}
creators[devices.HYDRAULIC_SYSTEM]	= {"avLuaDevice"		,LockOn_Options.script_path.."Systems/hydraulic_system.lua"}
creators[devices.AIRBRAKE]			= {"avLuaDevice"		,LockOn_Options.script_path.."Systems/airbrake.lua"}
creators[devices.SYSTEMS]			= {"avLuaDevice"		,LockOn_Options.script_path.."Systems/systems.lua"}
creators[devices.LIGHT_SYSTEM]		= {"avLuaDevice"		,LockOn_Options.script_path.."Systems/light_system.lua"}
creators[devices.FUEL_SYSTEM]		= {"avLuaDevice"		,LockOn_Options.script_path.."Systems/fuel_system.lua"}
creators[devices.GYRO_SYSTEM]		= {"avLuaDevice"		,LockOn_Options.script_path.."Systems/gyro_system.lua"}
creators[devices.START_PANEL]		= {"avLuaDevice"		,LockOn_Options.script_path.."Systems/start_panel.lua"}
creators[devices.CANOPY]			= {"avLuaDevice"	    ,LockOn_Options.script_path.."Systems/canopy.lua"}

--RADAR OFF creators[devices.RADAR]			 = {"avSimpleRadar"			,LockOn_Options.script_path.."RADAR/Device/init.lua"}

-- Indicators
indicators = {}
indicators[#indicators + 1] = {"ccIndicator" ,LockOn_Options.script_path.."HUD/Indicator/init.lua"  ,nil,{{"PNT-HUD-CENTER","PNT-HUD-DOWN","PNT-HUD-RIGHT"},{sx_l = 0,sy_l = 0,sz_l = 0,sh = 0,sw = 0}}} --HUD
-- RADAR OFF 
indicators[#indicators + 1] = {"ccIndicator",LockOn_Options.script_path.."RADAR/Indicator/init.lua",--init script
  nil,--id of parent device
  {	
	{}, -- initial geometry anchor , triple of connector names 
	{sx_l =  0,  -- center position correction in meters (forward , backward)
	 sy_l =  0,  -- center position correction in meters (up , down)
	 sz_l =  0,  -- center position correction in meters (left , right)
	 sh   =  0,  -- half height correction 
	 sw   =  0,  -- half width correction 
	 rz_l =  0,  -- rotation corrections  
	 rx_l =  0,
	 ry_l =  0}
  }
} --RADAR

			 