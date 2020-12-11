minetest.register_globalstep(function()
	if minetest.settings:get_bool("digcustom") then
		local list = (minetest.settings:get("digcustom_nodes") or ""):split(",")
		local positions = minetest.find_nodes_near(minetest.localplayer:get_pos(), 5, list, true)
		for i, pos in ipairs(positions) do
			if i > 5 then break end
			minetest.dig_node(pos)
		end
	end
end)

minetest.register_list_command("digcustom", "Configue custom autodig nodes", "digcustom_nodes")

minetest.register_cheat("DigCustom", "World", "digcustom")
