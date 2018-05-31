return {

keyCommands = {
{combos = {{key = 'MOUSE_BTN2'}}, down = iCommand_ExplorationStart, name = 'Enable visual recon mode', category = 'View Cockpit'},
{combos = {{key = 'MOUSE_BTN3'}}, down = iCommandViewTransposeModeOn, up = iCommandViewTransposeModeOff, name = 'Camera transpose mode (press and hold)', category = 'View Cockpit'},
},

axisCommands = {
-- mouse axes
{combos = {{key = 'MOUSE_X'}}, action = iCommandPlaneViewHorizontal, name = 'Camera Horizontal View'},
{combos = {{key = 'MOUSE_Y'}}, action = iCommandPlaneViewVertical, name = 'Camera Vertical View'},
{combos = {{key = 'MOUSE_Z'}}, action = iCommandPlaneZoomView, name = 'Camera Zoom View'},

{action = iCommandPlaneSelecterHorizontal, name = 'TDC Slew Horizontal (mouse)'},
{action = iCommandPlaneSelecterVertical	, name = 'TDC Slew Vertical (mouse)'},
},
}
