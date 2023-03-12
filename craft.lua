-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
------------------------------------------------------------------------

nodecore.register_craft({
	label = "carve runestone",
	action = "pummel",
	toolgroups = {cracky = 3},
	indexkeys = {"nc_concrete:terrain_stone_boxy"},
	nodes = {
		{
			y = 1,
			match = {groups = {alpha_glyph = true}},
		},
		{
		match = "nc_concrete:terrain_stone_boxy",
		replace = modname .. ":hedron"
		}
	}
})



