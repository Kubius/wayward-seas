if settings.startup["enable_ws_worldgen"].value then
    require("__wayward-seas__/prototypes/world_gen")
end
require("__wayward-seas__/prototypes/placement_adjust")

table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories,"organic-or-hand-crafting")

if mods["slipstacks"] then
    table.insert(data.raw["plant"]["slipstack-plant"].autoplace.tile_restriction,"raised-lakebed")
end