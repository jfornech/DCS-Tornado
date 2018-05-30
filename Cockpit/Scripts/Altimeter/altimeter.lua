local dev 	    = GetSelf()
local sensor_data = get_base_data()

--debug_output_file = io.open("./Altimeter.log", "wa")
--debug_output_file:write("Démarrage Altimeter\r\n")

local feet_per_meter = 3.2808399

local update_time_step = 0.1
make_default_activity(update_time_step)
--update will be called 10 times per second

local Alt10000 = get_param_handle("Alt10000")
local Alt1000  = get_param_handle("Alt1000")
local Alt100   = get_param_handle("Alt100")
local L_10K = get_param_handle("L_10K")
local L_10000 = get_param_handle("L_10000")
local r_altitude = get_param_handle("RAD_ALT")
local SAFE_ALT = get_param_handle("SAFE_ALT")
local RSA = 0
local Flag_Sonde = get_param_handle("Flag_Sonde")
local L_SAFE_ALT = get_param_handle("L_SAFE_ALT")
local Pression = get_param_handle("Pression")
local Timer = 0
local Baro = 0

Alt100:set(0)
Alt1000:set(0)
Alt10000:set(0)
Altitude = 0
T_10K_ARM = 0
L_10K:set(0) 
L_10000:set(0)
Flag_Sonde:set(1)
SAFE_ALT:set(30)
L_SAFE_ALT:set(0)
Pression:set("1008")
Baro = tonumber(Pression:get())
RSA = SAFE_ALT:get()
 
function post_initialize()
    
end

function SetCommand(command,value)

	--debug_output_file:write("SafeAlti : "..command.." , "..value.."\r\n")

	if command == 3001 then  -- Reset
		L_10K:set(0)
		T_10K_ARM = 0
	end
	if command == 3050 then  -- Baro +- 1
		Baro = tonumber(Pression:get())
		Baro = Baro + value
	end
	if command == 3051 then  -- Safe alti +- 1
		RSA = tonumber(SAFE_ALT:get())
		RSA = RSA + value
	end
end

function update()
			
	Pression:set(tostring(Baro))
	SAFE_ALT:set(RSA)
	
	local Altitude = sensor_data.getBarometricAltitude()*feet_per_meter

	local diff = 1013 - Baro
	Altitude = Altitude + (diff * 12)
	
	Alt100:set(((Altitude)/10) % 1000)	 			-- 12345 % 1000 = 345
	Alt1000:set((((Altitude)/100) % 10000 ) % 100)  -- 12345 % 10000 = 2345
	Alt10000:set((Altitude)/10000)
	
	-- 10 000ft annunciator setup
	if Altitude > 10000 then
		L_10000:set(1)
		T_10K_ARM = 1
	end
	-- 10 000ft annunciator light
	if Altitude < 10000 and T_10K_ARM > 0 then
		Timer = Timer +1
		if math.mod(Timer,10) > 5 then   -- (10 units = 1 sec) 5 units =0.5 seconds
			L_10K:set(1)
			else
			L_10K:set(0)
		end
	end	
	
	r_altitude:set(sensor_data.getRadarAltitude()) --*3.28084)
		
	if r_altitude:get() > 300 then
		Flag_Sonde:set(1)
	else
		Flag_Sonde:set(0)
	end
	
	if r_altitude:get() < SAFE_ALT:get() then
		L_SAFE_ALT:set(1)
	else
		L_SAFE_ALT:set(0)
	end
	

end