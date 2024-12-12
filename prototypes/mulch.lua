local item_sounds = require("__base__.prototypes.item_sounds")

data:extend{
  {
    type = "item",
    name = "lakebed-mulch",
    localised_name = {"item-name.lakebed-mulch"},
    icon = "__wayward-seas__/graphics/icons/swampfill.png",
    subgroup = "terrain",
    order = "c[mulch]-a[dirt]",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 100,
    weight = 5 * kg,
    place_as_tile =
    {
      result = "raised-lakebed",
      condition_size = 1,
      condition = {layers={ground_tile=true}},
      tile_condition = {"gleba-deep-lake"}
    }
  },
  {
    type = "technology",
    name = "lakebed-mulch",
    icon = "__wayward-seas__/graphics/technology/swampfill-tech.png",
    icon_size = 256,
    prerequisites = {"agriculture","landfill"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "lakebed-mulch"
      }
    },
    research_trigger =
    {
      type = "craft-item",
      item = "agricultural-tower"
    },
  },
  {
    type = "recipe",
    name = "lakebed-mulch",
    energy_required = 0.5,
    enabled = false,
    category = "organic-or-hand-crafting",
    ingredients =
    {
      {type = "item", name = "stone", amount = 10},
      {type = "item", name = "wood", amount = 10},
      {type = "item", name = "nutrients", amount = 5},
    },
    results = {{type="item", name="lakebed-mulch", amount=1}}
  }
}

local swampfill = util.table.deepcopy(data.raw["tile"]["wetland-dead-skin"])
swampfill.name = "raised-lakebed"
swampfill.order = "a[artificial]-d[utility]-b[raised-lakebed]"
swampfill.subgroup = "artificial-tiles"
swampfill.autoplace = nil
swampfill.is_foundation = true
swampfill.allows_being_covered = false
swampfill.minable = {mining_time = 0.5, result = "lakebed-mulch"}
swampfill.mined_sound = item_sounds.landfill_inventory_pickup
swampfill.layer = 5
swampfill.build_sound = data.raw["tile"]["landfill"].build_sound
swampfill.map_color = {25,49,98}
data:extend({swampfill})