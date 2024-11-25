local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local seconds = 60
local minutes = 60*seconds

local neutral_soils = {
	"landfill",
	"lowland-olive-blubber",
	"lowland-olive-blubber-2",
	"lowland-olive-blubber-3",
	"lowland-brown-blubber",
	"lowland-pale-green",
	"lowland-cream-cauliflower-2",
	"lowland-cream-cauliflower",
	"lowland-dead-skin",
	"lowland-dead-skin-2",
	"lowland-cream-red",
	"lowland-red-vein",
	"lowland-red-vein-2",
	"lowland-red-vein-3",
	"lowland-red-vein-4",
	"lowland-red-vein-dead",
	"lowland-red-infection",
	"midland-cracked-lichen",
	"midland-cracked-lichen-dull",
	"midland-cracked-lichen-dark",
	"midland-turquoise-bark",
	"midland-turquoise-bark-2",
	"midland-yellow-crust",
	"midland-yellow-crust-2",
	"midland-yellow-crust-3",
	"midland-yellow-crust-4",
	"highland-dark-rock",
	"highland-dark-rock-2",
	"highland-yellow-rock",
	"pit-rock"
}

local sunnycomb_plant = util.table.deepcopy(data.raw["tree"]["sunnycomb"])
sunnycomb_plant.type = "plant"
sunnycomb_plant.name = "sunnycomb-plant"
sunnycomb_plant.flags = plant_flags
sunnycomb_plant.hidden_in_factoriopedia = false
sunnycomb_plant.factoriopedia_alternative = nil
sunnycomb_plant.created_effect = nil
sunnycomb_plant.harvest_emissions = {spores = 5}
sunnycomb_plant.agricultural_tower_tint =
{
	primary = {r = 0.619, g = 0.518, b = 0.049, a = 1.000},
	secondary = {r = 0.670, g = 0.556, b = 0.109, a = 1.000}
}
sunnycomb_plant.minable.results = {
	{type = "item", name = "sunnycomb-seed", amount = 5}
}
sunnycomb_plant.growth_ticks = 8 * minutes
sunnycomb_plant.surface_conditions = { {property = "pressure", min = 2000, max = 2000}}
sunnycomb_plant.autoplace =
{
  probability_expression = 0,
  -- required to show agricultural tower plots
  tile_restriction = neutral_soils
}

data:extend({sunnycomb_plant})
data.raw["tree"]["sunnycomb"].minable.results = {
	{type = "item", name = "sunnycomb-seed", amount = 5}
}


data:extend{
-- sunnycomb "propagule"?
  {
    type = "item",
    name = "sunnycomb-seed",
    localised_name = {"item-name.sunnycomb-seed"},
    localised_description = {"item-description.sunnycomb-seed"},
	icon = "__space-age__/graphics/icons/sunnycomb.png",
--[[
    icon = "__wayward-seas__/graphics/icons/sunnycomb-seed.png",
    pictures =
    {
      { size = 64, filename = "__wayward-seas__/graphics/icons/sunnycomb-seed-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__wayward-seas__/graphics/icons/sunnycomb-seed-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__wayward-seas__/graphics/icons/sunnycomb-seed-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__wayward-seas__/graphics/icons/sunnycomb-seed-4.png", scale = 0.5, mipmap_count = 4 },
    },
]]
    subgroup = "agriculture-processes",
    order = "a[seeds]-a[sunnycomb-seed]",
    plant_result = "sunnycomb-plant",
    place_result = "sunnycomb-plant",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "gleba",
    fuel_category = "chemical",
    fuel_value = "1MJ"
  },
-- mulch the propagule, get spoilage and bacteria
  {
    type = "recipe",
    name = "sunnycomb-processing",
    icon = "__space-age__/graphics/icons/sunnycomb.png",
    category = "organic-or-hand-crafting",
    subgroup = "agriculture-processes",
    order = "a[seeds]-a[sunnycomb-processing]",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients = {{type = "item", name = "sunnycomb-seed", amount = 1}},
    results =
    {
      {type = "item", name = "spoilage", amount = 3},
      {type = "item", name = "copper-bacteria", amount = 1}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.619, g = 0.518, b = 0.049, a = 1.000},
	  secondary = {r = 0.670, g = 0.556, b = 0.109, a = 1.000}
    }
  },
}

data.raw.technology["planet-discovery-gleba"].effects[2] = {
  type = "unlock-recipe",
  recipe = "sunnycomb-processing",
}
--[[
data.raw.technology["planet-discovery-gleba"].effects[3] = {
  type = "unlock-recipe",
  recipe = "lickmaw-processing",
}
]]