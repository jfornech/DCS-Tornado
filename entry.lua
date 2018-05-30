declare_plugin("Tornado by Someone",
{
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
version		 = "1.1.1.1",		 
state		 = "installed",
info		 = _("The ultimate Tornado . info about me and my addon"),

Skins	= 
	{
		{
			name	= "Tornado",
			dir		= "Theme"
		},
	},
Missions =
	{
		{
			name		= _("Tornado"),
			dir			= "Missions",
			CLSID		= "{CLSID5456456346CLSID}",	
		},
	},	
LogBook =
	{
		{
			name		= _("Tornado"),
			type		= "Tornado",
		},
	},	
InputProfiles =
	{
		["Tornado"]     = current_mod_path .. '/Input',
	},
})
---------------------------------------------------------------------------------------
dofile(current_mod_path..'/Tornado.lua')
dofile(current_mod_path.."/Views.lua")
make_view_settings('Tornado', ViewSettings, SnapViews)


plugin_done()-- finish declaration , clear temporal data
