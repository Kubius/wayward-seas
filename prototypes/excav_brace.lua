local item_sounds = require("__base__.prototypes.item_sounds")

local excavation_brace_research = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1},
  {"agricultural-science-pack", 1},
}
local excavation_brace_ticks = 500
local excavation_brace_prereq = {"lakebed-mulch","concrete","agricultural-science-pack"}

if mods["any-planet-start"] then
  local planet = settings.startup["aps-planet"].value
  if planet == "gleba" then
    excavation_brace_research = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"military-science-pack", 1},
    }
    excavation_brace_ticks = 250
    excavation_brace_prereq = {"lakebed-mulch","concrete","military-science-pack"}
  end
end

data:extend{
  {
    type = "item",
    name = "excavation-brace",
    localised_name = {"item-name.excavation-brace"},
    icon = "__wayward-seas__/graphics/icons/excavation-brace.png",
    subgroup = "terrain",
    order = "c[mulch]-a[dirt]",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 200,
    place_as_tile =
    {
      result = "excavated-trench",
      condition_size = 1,
      condition = {layers={ground_tile=true}},
      tile_condition = {"wetland-dead-skin","wetland-light-dead-skin","wetland-blue-slime"}
    }
  },
  {
    type = "technology",
    name = "excavation-brace",
    icon = "__wayward-seas__/graphics/technology/excavation-brace.png",
    icon_size = 256,
    prerequisites = excavation_brace_prereq,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "excavation-brace"
      }
    },
    unit =
    {
      count = excavation_brace_ticks,
      ingredients = excavation_brace_research,
      time = 30
    },
  },
  {
    type = "recipe",
    name = "excavation-brace",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "refined-concrete", amount = 10},
      {type = "item", name = "iron-stick", amount = 10}
    },
    results = {{type="item", name="excavation-brace", amount = settings.startup["excav_brace_yield"].value}}
  }
}

local legally_distinct_lake = util.table.deepcopy(data.raw["tile"]["gleba-deep-lake"])
legally_distinct_lake.name = "excavated-trench"
legally_distinct_lake.order = "a[artificial]-d[utility]-b[raised-lakebed]"
legally_distinct_lake.subgroup = "artificial-tiles"
legally_distinct_lake.autoplace = nil
legally_distinct_lake.is_foundation = true
legally_distinct_lake.allows_being_covered = false
legally_distinct_lake.minable = {mining_time = 0.4, result = "excavation-brace"}
legally_distinct_lake.mined_sound = item_sounds.landfill_inventory_pickup
legally_distinct_lake.layer = 5
legally_distinct_lake.build_sound = data.raw["tile"]["concrete"].build_sound
legally_distinct_lake.map_color = {12,8,21}
data:extend({legally_distinct_lake})