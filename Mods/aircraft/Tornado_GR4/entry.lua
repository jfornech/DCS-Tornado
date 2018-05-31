declare_plugin("Tornado_GR4",
{
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
version		 = "0.1 Alpha",	-- 	 
state		 = "installed",
info		 = _("Tornado_GR4"),
binaries   =
{
--'ED_FM_Template',
nil,
},
Skins	=
	{
		{
			name	= _("Tornado_GR4"),
			dir		= "Skins/1"
		},
	},
Missions =
	{
		{
			name		= _("Tornado_GR4"),
			dir			= "Missions",
			CLSID		= "{CLSID5456456346CLSID}",	
		},
	},	
LogBook =
	{
		{
			name		= _("Tornado_GR4"),
			type		= "Tornado_GR4",
		},
	},	
InputProfiles =
	{
		["Tornado_GR4"]     = current_mod_path .. '/Input',
	},
})---------------------------------------------------------------------------------------

-- mounting 3d model paths and texture paths 

mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures")
mount_vfs_texture_path  (current_mod_path.."/Textures/Avionics")
mount_vfs_texture_path  (current_mod_path.."/Cockpit/Resources/Model/Textures")
mount_vfs_model_path	(current_mod_path.."/Cockpit/Resources/Model/Shape")

-- Option Cockpit operationnel, HUD partiel
make_flyable('Tornado_GR4'	, current_mod_path..'/Cockpit/Scripts/',nil, current_mod_path..'/comm.lua')

-- Option vieux cockpit pourri avec HUD A10
--make_flyable('Tornado_GR4'   , current_mod_path..'/Cockpit/KneeboardLeft/', {self_ID,'Tornado_GR4',old = 17}, current_mod_path..'/Comm.lua') 

dofile(current_mod_path.."/Views.lua")

make_view_settings('Tornado_GR4', ViewSettings, SnapViews)

plugin_done()-- finish declaration , clear temporal data
