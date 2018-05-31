local dev = GetSelf()

debug_output_file = io.open("./PanelTest.log", "wa")
debug_output_file:write("Démarrage Panel Test\r\n")

local update_time_step = 0.5
make_default_activity(update_time_step) --update will be called 10 times per second

local sensor_data = get_base_data()

local L_BATT = get_param_handle("L_BATT")
local L_CONVL = get_param_handle("L_CONVL")
local L_CONVR = get_param_handle("L_CONVR")
local L_GENL = get_param_handle("L_GENL")
local L_GENR = get_param_handle("L_GENR")
local L_REGL = get_param_handle("L_REGL")
local L_REGR = get_param_handle("L_REGR")

L_BATT:set(0)
L_CONVL:set(0)
L_CONVR:set(0)
L_GENL:set(1)
L_GENR:set(1)
L_REGL:set(0)
L_REGR:set(0)

function SetCommand(command,value)
	debug_output_file:write("bouton test : "..command.."\r\n")

	if if command == 3001 then
		L_BATT:set(1)
		L_CONVL:set(1)
		L_CONVR:set(1)
		L_GENL:set(1)
		L_GENR:set(1)
		L_REGL:set(1)
		L_REGR:set(1)
	else
		L_BATT:set(0)
		L_CONVL:set(0)
		L_CONVR:set(0)
		L_GENL:set(0)
		L_GENR:set(0)
		L_REGL:set(0)
		L_REGR:set(0)
	end
end

function update()

end

need_to_be_closed = false -- close lua state after initialization
