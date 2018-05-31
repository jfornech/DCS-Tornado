dofile(LockOn_Options.script_path.."HUD/Indicator/definitions.lua")

local sensor_data = get_base_data()
local P_HYD1 = get_param_handle("P_HYD1")
local P_HYD2 = get_param_handle("P_HYD2")

PitchLineClipRadius = 163

function AddElement(object)
    object.use_mipfilter    = true
	object.additive_alpha   = true
	object.h_clip_relation  = h_clip_relations.COMPARE
	object.level			= HUD_DEFAULT_LEVEL
    Add(object)
end

local BASE_COLOR  = {255,0  ,0,255}
local BASE_COLOR2 = {0,255,0,255} --128,165,0,120
local PitchScale   		= MakeMaterial("HUD_grid2.tga",BASE_COLOR2) -- image of the fixed net
local BASE_COLOR_MAT    = MakeMaterial(nil,BASE_COLOR)

local shape_rotation = (sensor_data.getRoll()) * 57.3

-- shape_rotation = math.tan(shape_rotation/57.3) * 1000 -- to mils -- NOTE: this does nothing currently, returns 0

local full_radius = 400 -- is this the radius of "HUD/net view field"? Units 108 (pixels or angular units)? no effect!
local grid_shift  = (sensor_data.getPitch() / 57.3) * 1000 -- explain shift?-35
local grid_radius =  full_radius + grid_shift

local grid_origin	         = CreateElement "ceSimple"
grid_origin.name 		     = create_guid_string() -- no such function in this script. Not in definitions.lua either. Could be in elements_defs.lua
grid_origin.collimated 		 = true
AddElement(grid_origin)

local PitchScaleParam	    = CreateElement "ceTexPoly" --this could be the text area on HUD
PitchScaleParam.name 		= create_guid_string() -- this must be external function call.
PitchScaleParam.vertices   = {{-grid_radius, grid_radius},
			   { grid_radius, grid_radius},
			   { grid_radius,-grid_radius},
			   {-grid_radius,-grid_radius}}
PitchScaleParam.indices			= {0,1,2,2,3,0}
PitchScaleParam.tex_coords	 	= {{0,0},{1,0},{1,1},{0,1}}
PitchScaleParam.material		= PitchScale	   
PitchScaleParam.element_params  = {"HUD_PITCH"}  -- Global Variable to test
PitchScaleParam.controllers     = {{"move_up_down_using_parameter",0,0}} 
PitchScaleParam.collimated 		= true
PitchScaleParam.parent_element 	= grid_origin.name
AddElement(PitchScaleParam)

-------------------------------
function AddPitchLine(name, tex_params, parent, index)
	local Line = AddHUDTexElement(name, 
					{{-37, -2.5}, {-37, 2.5}, 
					{37, 2.5}, {37, -2.5}},
					tex_params, 
					{{"HUD_PITCH", index, 348, PitchLineClipRadius}},
					{0.0, index * five_degrees, 0.0},
					{0.0, 0.0, 0.0},
					parent,
					HUD_DEFAULT_LEVEL)

	textpos = -1.2
	if index < 0 then
		textpos = 0.8
	end
				
	local Text1 = AddHUDTextElement(("txt_"..name), 
				  {{"txt_pitch", index}}, 
				  {-41, textpos, 0.0}, 
				  name,
				  HUD_DEFAULT_LEVEL)
	
	local Text2 = AddHUDTextElement(("txt_"..name.. string.format("%i", 2)), 
				  {{"txt_pitch", index}}, 
				  {41, textpos, 0.0}, 
				  name,
				  HUD_DEFAULT_LEVEL)
end
-------------------------------------------

local FONT_         = MakeFont({used_DXUnicodeFontData = "font_cockpit_usa"},BASE_COLOR2,50,"test_font") --this is font object declaration. Mig-21 does not have fonts, therefore disabled.
local FONTROUGE_    = MakeFont({used_DXUnicodeFontData = "font_cockpit_usa"},BASE_COLOR,50,"test_font") --this is font object declaration. Mig-21 does not have fonts, therefore disabled.

local Heading_output         = CreateElement "ceStringPoly"
Heading_output.name            = create_guid_string()
Heading_output.material        = FONT_
Heading_output.init_pos        = {-100,-25}
Heading_output.alignment       = "LeftCenter"
Heading_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
Heading_output.formats         = {"HDG","%s"} 
Heading_output.element_params  = {"HDG"}  -- Global Variable to test
Heading_output.controllers     = {{"text_using_parameter",0,0}} --first index is for element_params (starting with 0) , second for formats ( starting with 0)
Heading_output.additive_alpha  = true
Heading_output.collimated     = true
AddElement(Heading_output)

local HDG_output 				= CreateElement "ceStringPoly"
HDG_output.name 				= create_guid_string()
HDG_output.material				 = FONT_
HDG_output.init_pos 			= {-100,-43}
HDG_output.alignment 			= "LeftCenter"
HDG_output.stringdefs 			= {0.017,0.95 * 0.01, 0, 0}
HDG_output.formats 				= {"%3.0f","%s"}
HDG_output.element_params 		= {"D_HDG"}
HDG_output.controllers 			= {{"text_using_parameter",0,0}}
HDG_output.additive_alpha 		= true
HDG_output.collimated 			= true
AddElement(HDG_output)

local Moteur_output         = CreateElement "ceStringPoly"
Moteur_output.name            = create_guid_string()
Moteur_output.material        = FONT_
Moteur_output.init_pos        = {100,-25}
Moteur_output.alignment       = "RightCenter"
Moteur_output.stringdefs      = {0.01,0.75 * 0.01, 0, 0}
Moteur_output.formats         = {"RPM","%s"} 
Moteur_output.element_params  = {"RPM"}  -- Global Variable to test
Moteur_output.controllers     = {{"text_using_parameter",0,0}} --first index is for element_params (starting with 0) , second for formats ( starting with 0)
Moteur_output.additive_alpha  = true
Moteur_output.collimated     = true
AddElement(Moteur_output)

local RPM_output = CreateElement "ceStringPoly"
RPM_output.name = create_guid_string()
RPM_output.material = FONT_
RPM_output.init_pos = {100,-43}
RPM_output.alignment = "RightCenter"
RPM_output.stringdefs = {0.017,0.95 * 0.01, 0, 0}
RPM_output.formats = {"%s","%s"}
RPM_output.element_params = {"LIB_RPM"}
RPM_output.controllers = {{"text_using_parameter",0,0}}
RPM_output.additive_alpha = true
RPM_output.collimated = true
AddElement(RPM_output)

local RPMPC_output = CreateElement "ceStringPoly"
RPMPC_output.name = create_guid_string()
RPMPC_output.material = FONTROUGE_
RPMPC_output.init_pos = {100,-43}
RPMPC_output.alignment = "RightCenter"
RPMPC_output.stringdefs = {0.015,0.93 * 0.01, 0, 0}
RPMPC_output.formats = {"%s","%s"}
RPMPC_output.element_params = {"LIB_RPMPC"}
RPMPC_output.controllers = {{"text_using_parameter",0,0}}
RPMPC_output.additive_alpha = true
RPMPC_output.collimated = true
AddElement(RPMPC_output)

local IAS = CreateElement "ceStringPoly"
IAS.name = create_guid_string()
IAS.material = FONT_
IAS.init_pos = {-105,23}
IAS.alignment = "LeftCenter"
IAS.stringdefs = {0.022,1.39 * 0.010, 0, 0}    --{ecrase vertical si inf a 0.01,ecrase lateral * streccth, 0, 0}
IAS.formats = {"%3.0f","%s"}
IAS.element_params = {"D_IAS"}
IAS.controllers = {{"text_using_parameter",0,0}}
IAS.additive_alpha = true
IAS.collimated = true
AddElement(IAS)

local G_output = CreateElement "ceStringPoly"
G_output.name = create_guid_string()
G_output.material = FONT_
G_output.init_pos = {0,-88}
G_output.alignment = "CenterCenter"
G_output.stringdefs = {0.017,0.95 * 0.01, 0, 0}
G_output.formats = {"G %2.1f","%s"}
G_output.element_params = {"current_G"}
G_output.controllers = {{"text_using_parameter",0,0}}
G_output.additive_alpha = true
G_output.collimated = true
AddElement(G_output)

local ALT_output = CreateElement "ceStringPoly"
ALT_output.name = create_guid_string()
ALT_output.material = FONT_
ALT_output.init_pos = {105,23}
ALT_output.alignment = "RightCenter"
ALT_output.stringdefs = {0.022,1.39 * 0.010, 0, 0}
ALT_output.formats = {"%.0f","%s"}
ALT_output.element_params = {"D_ALT"}
ALT_output.controllers = {{"text_using_parameter",0,0}}
ALT_output.additive_alpha = true
ALT_output.collimated = true
AddElement(ALT_output)

function texture_box (UL_X,UL_Y,W,H) --this is texture box function. Receives some coordinates and dimensions, returns 4 pairs of values. Nothing is calling this function inside script.
local texture_size_x = 128
local texture_size_y = 128
local ux = UL_X / texture_size_x
local uy = UL_Y / texture_size_y
local w  = W / texture_size_x
local h  = W / texture_size_y

return {{ux	    ,uy},
		{ux + w ,uy},
		{ux + w ,uy + h},
		{ux	 	,uy + h}}
end

function create_textured_box(UL_X,UL_Y,DR_X,DR_Y) -- function that creates textured square. This function is called 2 times in below code.

local size_per_pixel = 1/8
local texture_size_x = 128
local texture_size_y = 128
local W = DR_X - UL_X
local H = DR_Y - UL_Y

local half_x = 0.5 * W * size_per_pixel
local half_y = 0.5 * H * size_per_pixel
local ux 	 = UL_X / texture_size_x
local uy 	 = UL_Y / texture_size_y
local w  	 = W / texture_size_x
local h 	 = H / texture_size_y

local object = CreateElement "ceTexPoly"
object.vertices =  {{-half_x, half_y},
				    { half_x, half_y},
				    { half_x,-half_y},
				    {-half_x,-half_y}}
object.indices	  = {0,1,2,2,3,0}
object.tex_coords = {{ux     ,uy},
					 {ux + w ,uy},
					 {ux + w ,uy + h},
				     {ux 	 ,uy + h}}	 
				 
return object

end

gun_sight_mark 					= create_textured_box(7,7,25,25) -- this is create_textured_box function call with parameters
gun_sight_mark.material       	= PitchScale	
gun_sight_mark.name 			= BASE_COLOR_MAT
gun_sight_mark.collimated	  	= true
gun_sight_mark.element_params   = {"WS_GUN_PIPER_AVAILABLE",
								   "WS_GUN_PIPER_AZIMUTH",
								   "WS_GUN_PIPER_ELEVATION"} 
								   
gun_sight_mark.controllers 	   = {{"parameter_in_range"				,0,0.9,1.1},--check that piper available using WS_GUN_PIPER_AVAILABLE
								  {"move_left_right_using_parameter",1, 0.73 },	--azimuth move by WS_GUN_PIPER_AZIMUTH , 0.73 is default collimator distance (from eye to HUD plane)
								  {"move_up_down_using_parameter"   ,2, 0.73 }, --elevation move by WS_GUN_PIPER_ELEVATION
								 }
AddElement(gun_sight_mark)