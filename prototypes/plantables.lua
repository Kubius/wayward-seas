local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}
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

local only_gleba = false
if mods["onlyGleba"] then
  only_gleba = true
end


data:extend({{type = "collision-layer", name = "neutral_soil"}})

for _,target_tile in pairs(neutral_soils) do 
  data.raw.tile[target_tile].collision_mask.layers["neutral_soil"] = true
end

local sunnycomb_plant = util.table.deepcopy(data.raw["tree"]["sunnycomb"])
sunnycomb_plant.type = "plant"
sunnycomb_plant.name = "sunnycomb-plant"
sunnycomb_plant.flags = plant_flags
sunnycomb_plant.hidden_in_factoriopedia = false
sunnycomb_plant.factoriopedia_alternative = nil
sunnycomb_plant.created_effect = nil
sunnycomb_plant.harvest_emissions = {spores = 1.2}
sunnycomb_plant.agricultural_tower_tint =
{
	primary = {r = 0.619, g = 0.518, b = 0.049, a = 1.000},
	secondary = {r = 0.670, g = 0.556, b = 0.109, a = 1.000}
}
sunnycomb_plant.minable.results = {
	{type = "item", name = "sunnycomb-seed", amount = 7}
}
sunnycomb_plant.growth_ticks = 8 * minutes
sunnycomb_plant.surface_conditions = { {property = "pressure", min = 2000, max = 2000} }
sunnycomb_plant.tile_buildability_rules = {
  {
    area = {{-0.55, -0.55}, {0.55, 0.55}},
    required_tiles = {layers={neutral_soil=true}},
    colliding_tiles = {layers={water_tile=true}},
    remove_on_collision = true
  }
}
sunnycomb_plant.autoplace = nil
data:extend({sunnycomb_plant})
data.raw["tree"]["sunnycomb"].minable.results = {
	{type = "item", name = "sunnycomb-seed", amount = 5}
}

local cuttlepop_plant = util.table.deepcopy(data.raw["tree"]["cuttlepop"])
cuttlepop_plant.type = "plant"
cuttlepop_plant.name = "cuttlepop-plant"
cuttlepop_plant.flags = plant_flags
cuttlepop_plant.hidden_in_factoriopedia = false
cuttlepop_plant.factoriopedia_alternative = nil
cuttlepop_plant.created_effect = nil
cuttlepop_plant.harvest_emissions = {spores = 0.6}
cuttlepop_plant.agricultural_tower_tint =
{
	primary = {r = 0.769, g = 0.615, b = 0.823, a = 1.000},
	secondary = {r = 0.894, g = 0.784, b = 0.882, a = 1.000}
}
cuttlepop_plant.minable.results = {
	{type = "item", name = "cuttlepop-seed", amount = 4}
}
cuttlepop_plant.growth_ticks = 4 * minutes
cuttlepop_plant.surface_conditions = { {property = "pressure", min = 2000, max = 2000} }
cuttlepop_plant.tile_buildability_rules = {
  {
    area = {{-0.55, -0.55}, {0.55, 0.55}},
    required_tiles = {layers={water_tile=true}},
    colliding_tiles = {layers={player=true}},
    remove_on_collision = true
  }
}
cuttlepop_plant.autoplace = nil
data:extend({cuttlepop_plant})
data.raw["tree"]["cuttlepop"].minable.results = {
	{type = "item", name = "cuttlepop-seed", amount = 3}
}

local watercane_plant = util.table.deepcopy(data.raw["tree"]["water-cane"])
watercane_plant.type = "plant"
watercane_plant.name = "water-cane-plant"
watercane_plant.flags = plant_flags
watercane_plant.hidden_in_factoriopedia = false
watercane_plant.factoriopedia_alternative = nil
watercane_plant.created_effect = nil
watercane_plant.agricultural_tower_tint =
{
	primary = {r = 0.737, g = 0.443, b = 0.141, a = 1.000},
	secondary = {r = 0.764, g = 0.525, b = 0.263, a = 1.000}
}
watercane_plant.minable.results = {
	{type = "item", name = "cut-water-cane", amount = 3}
}
watercane_plant.growth_ticks = 135 * seconds
watercane_plant.surface_conditions = { {property = "pressure", min = 2000, max = 2000} }
watercane_plant.tile_buildability_rules = {
  {
    area = {{-0.55, -0.55}, {0.55, 0.55}},
    required_tiles = {layers={water_tile=true}},
    colliding_tiles = {layers={player=true}},
    remove_on_collision = true
  }
}
watercane_plant.autoplace = nil
data:extend({watercane_plant})

data.raw["tree"]["water-cane"].minable.results = {
	{type = "item", name = "cut-water-cane", amount = 2}
}

data:extend{
-- sunnycomb "propagule"?
  {
    type = "item",
    name = "sunnycomb-seed",
    localised_name = {"item-name.sunnycomb-seed"},
    localised_description = {"item-description.sunnycomb-seed"},
    icon = "__wayward-seas__/graphics/icons/sunnycomb-seed-1.png",
    pictures =
    {
      { size = 64, filename = "__wayward-seas__/graphics/icons/sunnycomb-seed-1.png", scale = 0.5 },
      { size = 64, filename = "__wayward-seas__/graphics/icons/sunnycomb-seed-2.png", scale = 0.5 },
      { size = 64, filename = "__wayward-seas__/graphics/icons/sunnycomb-seed-3.png", scale = 0.5 },
      { size = 64, filename = "__wayward-seas__/graphics/icons/sunnycomb-seed-4.png", scale = 0.5 },
    },
    subgroup = "agriculture-processes",
    order = "a[seeds]-a-a[sunnycomb-seed]",
    plant_result = "sunnycomb-plant",
    place_result = "sunnycomb-plant",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    weight = 1 * kg,
    default_import_location = "gleba",
    fuel_category = "chemical",
    fuel_value = "2MJ"
  },
-- mulch the propagule, get spoilage and bacteria
  {
    type = "recipe",
    name = "sunnycomb-processing",
    icon = "__wayward-seas__/graphics/icons/sunnycomb-processing.png",
    category = "organic-or-hand-crafting",
    subgroup = "agriculture-processes",
    order = "a[seeds]-a-a[sunnycomb-processing]",
    enabled = only_gleba,
    allow_decomposition = false,
    allow_productivity = true,
    energy_required = 0.5,
    ingredients = {{type = "item", name = "sunnycomb-seed", amount = 1}},
    results =
    {
      {type = "item", name = "spoilage", amount = 3},
      {type = "item", name = "copper-bacteria", amount = 2}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.619, g = 0.518, b = 0.049, a = 1.000},
	    secondary = {r = 0.670, g = 0.556, b = 0.109, a = 1.000}
    }
  },
  {
    type = "item",
    name = "cuttlepop-seed",
    localised_name = {"item-name.cuttlepop-seed"},
    localised_description = {"item-description.cuttlepop-seed"},
    icon = "__wayward-seas__/graphics/icons/cuttlepop-pod-1.png",
    pictures =
    {
      { size = 64, filename = "__wayward-seas__/graphics/icons/cuttlepop-pod-1.png", scale = 0.5},
      { size = 64, filename = "__wayward-seas__/graphics/icons/cuttlepop-pod-2.png", scale = 0.5},
      { size = 64, filename = "__wayward-seas__/graphics/icons/cuttlepop-pod-3.png", scale = 0.5},
      { size = 64, filename = "__wayward-seas__/graphics/icons/cuttlepop-pod-4.png", scale = 0.5},
    },
    subgroup = "agriculture-processes",
    order = "a[seeds]-a-b[cuttlepop-seed]",
    plant_result = "cuttlepop-plant",
    place_result = "cuttlepop-plant",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    weight = 1 * kg,
    default_import_location = "gleba",
    fuel_category = "chemical",
    fuel_value = "3MJ"
  },
  {
    type = "recipe",
    name = "cuttlepop-processing",
    icon = "__wayward-seas__/graphics/icons/cuttlepop-processing.png",
    category = "organic-or-hand-crafting",
    subgroup = "agriculture-processes",
    order = "a[seeds]-a-b[cuttlepop-processing]",
    enabled = only_gleba,
    allow_decomposition = false,
    allow_productivity = true,
    energy_required = 0.5,
    ingredients = {{type = "item", name = "cuttlepop-seed", amount = 1}},
    results =
    {
      {type = "item", name = "spoilage", amount = 4},
      {type = "item", name = "iron-bacteria", amount = 2}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.619, g = 0.518, b = 0.049, a = 1.000},
      secondary = {r = 0.670, g = 0.556, b = 0.109, a = 1.000}
    }
  },
  {
    type = "item",
    name = "cut-water-cane",
    localised_name = {"item-name.cut-water-cane"},
    localised_description = {"item-description.cut-water-cane"},
    icon = "__wayward-seas__/graphics/icons/water-cane-1.png",
    pictures =
    {
      { size = 64, filename = "__wayward-seas__/graphics/icons/water-cane-1.png", scale = 0.5},
      { size = 64, filename = "__wayward-seas__/graphics/icons/water-cane-2.png", scale = 0.5},
      { size = 64, filename = "__wayward-seas__/graphics/icons/water-cane-3.png", scale = 0.5},
    },
    subgroup = "agriculture-processes",
    order = "a[seeds]-a-c[cut-water-cane]",
    plant_result = "water-cane-plant",
    place_result = "water-cane-plant",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    weight = 1 * kg,
    default_import_location = "gleba",
    fuel_category = "chemical",
    fuel_value = "2MJ"
  },
  {
    type = "recipe",
    name = "water-cane-separation",
    icon = "__wayward-seas__/graphics/icons/water-cane-separation.png",
    category = "organic-or-hand-crafting",
    subgroup = "agriculture-processes",
    order = "a[seeds]-a-c[water-cane-separation]",
    enabled = only_gleba,
    allow_decomposition = false,
    allow_productivity = true,
    energy_required = 0.5,
    ingredients = {{type = "item", name = "cut-water-cane", amount = 2}},
    results =
    {
      {type = "item", name = "wood", amount = 1}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.619, g = 0.518, b = 0.049, a = 1.000},
      secondary = {r = 0.670, g = 0.556, b = 0.109, a = 1.000}
    }
  },
}

if not only_gleba then
  data.raw.technology["planet-discovery-gleba"].effects[2] = {
    type = "unlock-recipe",
    recipe = "sunnycomb-processing",
  }
  data.raw.technology["planet-discovery-gleba"].effects[3] = {
    type = "unlock-recipe",
    recipe = "cuttlepop-processing",
  }
  data.raw.technology["planet-discovery-gleba"].effects[4] = {
    type = "unlock-recipe",
    recipe = "water-cane-separation",
  }
end