if settings.startup["enable_ws_worldgen"].value then
    require("__wayward-seas__/prototypes/world_gen")
end
require("__wayward-seas__/prototypes/placement_adjust")

table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories,"organic-or-hand-crafting")
table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories,"organic-or-assembling")

local do_extra_start_tweaks = false

if mods["any-planet-start"] and settings.startup["aps-planet"].value == "gleba" then
    local miltech = data.raw["technology"]["military-science-pack"].prerequisites
    for indexer, prerequisite in pairs(miltech) do
        if prerequisite == "sulfur-processing" then
            table.remove(miltech,indexer)
        end
    end
    table.insert(miltech,"resin-tech")
    do_extra_start_tweaks = true
elseif mods["planet-picker"] then
    do_extra_start_tweaks = true
end

if do_extra_start_tweaks and settings.startup["gleba_start_faster_rockets"].value then
    data.raw["technology"]["rocket-turret"].unit = {
        ingredients =
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"military-science-pack", 1},
            {"chemical-science-pack", 1},
            {"agricultural-science-pack", 1}
        },
        time = 30,
        count = 250
    }
    data.raw["technology"]["carbon-fiber"].unit = {
        ingredients =
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"agricultural-science-pack", 1}
        },
        time = 30,
        count = 200
    }
end
if (do_extra_start_tweaks or settings.startup["always_evo_curve"].value) and settings.startup["pentapod_evo_curve"].value > 0 then
    -- value of 100 is 100% effectiveness

    -- none to small offset, 0.1 at max strength; evolution before stompers/strafers can start appearing at all
    local n2so = settings.startup["pentapod_evo_curve"].value * 0.001
    -- small to medium offset, 0.2 at max strength, added to default mid-stompy start of 0.1
    local s2mo = 0.1 + settings.startup["pentapod_evo_curve"].value * 0.002
    -- medium to large offset, 0.1 at max strength, added to default big-stompy start of 0.6
    local m2lo = 0.6 + (settings.startup["pentapod_evo_curve"].value * 0.001)

    data.raw["unit-spawner"]["gleba-spawner"].result_units =
    {
        {"small-wriggler-pentapod", {{0.0, 0.4}, {0.1, 0.4}, {0.6, 0}}},
        {"small-strafer-pentapod", {{n2so, 0.4}, {s2mo, 0.4}, {m2lo, 0}}},
        {"small-stomper-pentapod", {{n2so, 0.2}, {s2mo, 0.2}, {m2lo, 0}}},
        {"medium-wriggler-pentapod", {{0.1, 0}, {0.6, 0.4}, {0.95, 0}}},
        {"medium-strafer-pentapod", {{s2mo, 0}, {m2lo, 0.4}, {0.95, 0}}},
        {"medium-stomper-pentapod", {{s2mo, 0}, {m2lo, 0.2}, {0.95, 0}}},
        {"big-wriggler-pentapod", {{0.6, 0}, {0.95, 0.4}, {1, 0.4}}},
        {"big-strafer-pentapod", {{m2lo, 0}, {0.95, 0.4}, {1, 0.4}}},
        {"big-stomper-pentapod", {{m2lo, 0}, {0.95, 0.2}, {1, 0.2}}},
    }
end