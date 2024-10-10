-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore, ItemStack, math_random
    = minetest, nodecore, ItemStack, math.random
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
local maximum = 12
local runecast = 0
local stone = "nc_terrain_stone.png^(nc_api_storebox_frame.png^[opacity:20)"
------------------------------------------------------------------------
local function runestone(name, desc, glyph)
	minetest.register_node(modname .. ":" ..name, {
		description = desc.. " Runestone",
		tiles = {stone.. "^" ..glyph},
		paramtype2 = "facedir",
--		placeparam = "facedir",
		groups = {
			stone = 1,
			rock = 1,
			snappy = 1,
			runestone = 1,
			falling_node = 1,
		},
		stack_family = modname .. ":hedron",
		crush_damage = 2,
		sounds = nodecore.sounds("nc_terrain_stony"),
		drop = modname.. ":hedron"
	})
end
------------------------------------------------------------------------
runestone("1",		"Cav",	"((nc_fire_coal_4.png^[mask:nc_writing_glyph_cav.png)^[opacity:75)")
runestone("2",		"Odo",	"((nc_fire_coal_4.png^[mask:nc_writing_glyph_odo.png)^[opacity:75)")
runestone("3",		"Niz",	"((nc_fire_coal_4.png^[mask:nc_writing_glyph_niz.png)^[opacity:75)")
runestone("4",		"Zin",	"((nc_fire_coal_4.png^[mask:nc_writing_glyph_niz.png)^[opacity:75)^[transformFX")
runestone("5",		"Mew",	"((nc_fire_coal_4.png^[mask:nc_writing_glyph_mew.png)^[opacity:75)")
runestone("6",		"Fot",	"((nc_fire_coal_4.png^[mask:nc_writing_glyph_fot.png)^[opacity:75)")
runestone("7",		"Tof",	"((nc_fire_coal_4.png^[mask:nc_writing_glyph_fot.png)^[opacity:75)^[transformFX")
runestone("8",		"Yit",	"((nc_fire_coal_4.png^[mask:nc_writing_glyph_yit.png)^[opacity:75)")
runestone("9",		"Geq",	"((nc_fire_coal_4.png^[mask:nc_writing_glyph_geq.png)^[opacity:75)")
runestone("10",	"Qeg",	"((nc_fire_coal_4.png^[mask:nc_writing_glyph_geq.png)^[opacity:75)^[transformFX")
runestone("11",	"Prx",	"((nc_fire_coal_4.png^[mask:nc_writing_glyph_prx.png)^[opacity:75)")
runestone("12",	"Xrp",	"((nc_fire_coal_4.png^[mask:nc_writing_glyph_prx.png)^[opacity:75)^[transformFX")
------------------------------------------------------------------------
minetest.register_node(modname .. ":hedron", {
	description = "Runestone",
	tiles = {
		stone.. "^((nc_fire_coal_4.png^[mask:nc_writing_glyph_cav.png)^[opacity:75)",
		stone.. "^((nc_fire_coal_4.png^[mask:nc_writing_glyph_odo.png)^[opacity:75)",
		stone.. "^((nc_fire_coal_4.png^[mask:nc_writing_glyph_fot.png)^[opacity:75)",
		stone.. "^((nc_fire_coal_4.png^[mask:nc_writing_glyph_mew.png)^[opacity:75)",
		stone.. "^((nc_fire_coal_4.png^[mask:nc_writing_glyph_niz.png)^[opacity:75)",
		stone.. "^((nc_fire_coal_4.png^[mask:nc_writing_glyph_geq.png)^[opacity:75)"
	},
	paramtype2 = "facedir",
	groups = {
		stone = 1,
		rock = 1,
		snappy = 1,
		runestone = 1,
	},
	stack_max = 1,
	crush_damage = 2,
	sounds = nodecore.sounds("nc_terrain_stony"),
	on_place = function(itemstack, placer, pointed_thing)
		runecast = math.random(1,maximum)
		local stack = ItemStack(modname.. ":".. runecast)
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack()
	end,
})
------------------------------------------------------------------------
