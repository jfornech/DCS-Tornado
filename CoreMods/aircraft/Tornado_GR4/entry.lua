declare_plugin("Tornado_GR4",
{
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
displayName  = _("Tornado_GR4"),

fileMenuName = _("Tornado_GR4"),
update_id        = "Tornado_GR4",
version		 = "1.5.4",		 
state		 = "installed",
info		 = _("Tornado_GR4 AI."),
encyclopedia_path = current_mod_path..'/Encyclopedia',
})

dofile(current_mod_path..'/Tornado_GR4.lua')
plugin_done()