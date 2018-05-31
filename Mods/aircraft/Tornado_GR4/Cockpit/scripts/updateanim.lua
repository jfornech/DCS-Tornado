--=============================================================================
-- Updates click spots so they move with animations
--=============================================================================

local updateanim = GetSelf()

dt = 0.1 -- Run 10 times per second
make_default_activity(dt)

--element_PNT_136 = nil
element_LVR_COCKPIT = nil



function post_initialize()
	--element_PNT_136 = get_clickable_element_reference("PNT_136")

	element_LVR_COCKPIT = get_clickable_element_reference("LVR-COCKPIT")
end

function update()

	-- if element_PNT_136 then
		-- element_PNT_136:update()
	-- end 
	if element_LVR_COCKPIT then
		element_LVR_COCKPIT:update()
	end 

 
end
