data = {}
function data:extend (recipes)
	for i=1,#recipes do
		if recipes[i].type == "recipe" then
			parse_recipe(recipes[i])
		end
	end
end

function parse_recipe (recipe)
	if recipe.normal then
		iodata = recipe.normal
	else
		iodata = recipe
	end

	pname = recipe.name
	pin = ""
	for j=1,#iodata.ingredients do
		v = iodata.ingredients[j]
		if pin ~= "" then pin = pin .. "," end
		if v.name then
			pin = pin .. v.name .. "," .. v.amount
		else
			pin = pin .. v[1] .. "," .. v[2]
		end
	end

	pout = ""
	if iodata.result then
		pout = iodata.result .. "," .. (iodata.result_count and iodata.result_count or 1)
	else
		for j=1,#iodata.results do
			v = iodata.results[j]
			if pout ~= "" then pout = pout .. "," end
			pout = pout .. v.name .. "," .. v.amount
		end
	end
	print(pname, pin, pout)
end

dofile("game-data/ammo.lua")
dofile("game-data/capsule.lua")
dofile("game-data/demo-furnace-recipe.lua")
dofile("game-data/demo-recipe.lua")
dofile("game-data/demo-turret.lua")
dofile("game-data/equipment.lua")
dofile("game-data/fluid-recipe.lua")
dofile("game-data/furnace-recipe.lua")
dofile("game-data/inserter.lua")
dofile("game-data/module.lua")
dofile("game-data/recipe.lua")
dofile("game-data/turret.lua")
