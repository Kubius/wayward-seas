
--add to gleba planet discovery.
--better would be a technology that unlocks on gathering them, but more art yech
{type = "unlock-recipe",recipe = "sunnycomb-processing",}
{type = "unlock-recipe",recipe = "lickmaw-processing",} --MAYBE. it could be fun to require a sea tile for a cycleable. maybe wood though


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

--sunnycomb
.minable.results = {
	{type = "item", name = "sunnycomb-seed", amount = 5}
}
.growth_ticks = 8 * minutes,
.created_effect = nil
.harvest_emissions =  { spores = 5 }

.agricultural_tower_tint = {
	primary = {r = 0.619, g = 0.518, b = 0.049, a = 1.000},
	secondary = {r = 0.670, g = 0.556, b = 0.109, a = 1.000}
}

.tile_buildability_rules = {
	{area = {-0.55,-0.55},{0.55,0.55}},
	required_tiles = neutral_soils,
	remove_on_collision = true
}

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
    plant_result = "sunnycomb",
    place_result = "sunnycomb",
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
  }




















{
    type = "plant",
    name = "yumako-tree", -- food
    icon = "__space-age__/graphics/icons/yumako-tree.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results = {{type = "item", name = "yumako", amount = 50}},
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = leaf_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
    growth_ticks = 5 * minutes,
    harvest_emissions = plant_harvest_emissions,
    emissions_per_second = plant_emissions,
    max_health = 50,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    --collision_mask = {layers={player=true, ground_tile=true, train=true}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c[gleba]-a[seedable]-a[yumako-tree]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_yumako_tree,
    autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-a",
      probability_expression = "min(0.2, 0.3 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = {"natural-yumako-soil", "artificial-yumako-soil", "overgrowth-yumako-soil"}
    },
    variations = gleba_tree_variations("yumako-tree", 8, 4, 1.3),
    colors = minor_tints(),
    agricultural_tower_tint =
    {
      primary = {r = 0.552, g = 0.218, b = 0.218, a = 1.000}, -- #8c3737ff
      secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
    },
    -- tile_buildability_rules = { {area = {{-0.55, -0.55}, {0.55, 0.55}}, required_tiles = {"natural-yumako-soil", "artificial-yumako-soil"}, remove_on_collision = true} },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/yumako-tree", 6, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.2,
      average_pause_seconds = 8
    },
    map_color = {255, 255, 255},
  },