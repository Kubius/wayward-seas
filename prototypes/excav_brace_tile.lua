local item_sounds = require("__base__.prototypes.item_sounds")

local legally_distinct_lake = util.table.deepcopy(data.raw["tile"]["gleba-deep-lake"])
legally_distinct_lake.name = "excavated-trench"
legally_distinct_lake.order = "a[artificial]-d[utility]-b[raised-lakebed]"
legally_distinct_lake.subgroup = "artificial-tiles"
legally_distinct_lake.autoplace = nil
legally_distinct_lake.is_foundation = true
legally_distinct_lake.allows_being_covered = false
if settings.startup["enable_excav_brace"].value then
    legally_distinct_lake.minable = {mining_time = 0.4, result = "excavation-brace"}
else
    legally_distinct_lake.minable = {mining_time = 0.4, result = "iron-stick"}
end
legally_distinct_lake.mined_sound = item_sounds.landfill_inventory_pickup
legally_distinct_lake.layer = 5
legally_distinct_lake.build_sound = data.raw["tile"]["concrete"].build_sound
legally_distinct_lake.map_color = {12,8,21}
data:extend({legally_distinct_lake})