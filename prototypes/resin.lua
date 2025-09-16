data:extend{
  {
    type = "fluid",
    name = "gleba-resin",
    subgroup = "fluid",
    default_temperature = 125,
    base_color = {0.5, 0.35, 0},
    flow_color = {0.9, 0.65, 0.3},
    icon = "__wayward-seas__/graphics/icons/resin.png",
    order = "a[fluid]-q[gleba-resin]"
  },
  {
    type = "recipe",
    name = "gleba-resin",
    category = "chemistry",
    subgroup = "fluid-recipes",
    order = "q[gleba-resin]",
    energy_required = 3,
    enabled = false,
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    ingredients =
    {
      {type = "item", name = "sunnycomb-seed", amount = 1},
      {type = "item", name = "wood", amount = 1},
      {type = "fluid", name = "water", amount = 500},
      {type = "fluid", name = "steam", amount = 100}
    },
    results =
    {
      {type = "fluid", name = "gleba-resin", amount = 250}
    },
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.642, b = 0.261, a = 1.000}, -- #ffa342ff
      secondary = {r = 1.000, g = 0.722, b = 0.376, a = 1.000}, -- #ffb85fff
      tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000}, -- #d9a892ff
      quaternary = {r = 1.000, g = 0.494, b = 0.271, a = 1.000}, -- #ff7e45ff
    }
  },
  {
    type = "recipe",
    name = "resin-grenade",
    icon = "__wayward-seas__/graphics/icons/resin-grenade.png",
    enabled = false,
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    energy_required = 8,
    category = "crafting-with-fluid",
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 5},
      {type = "fluid", name = "gleba-resin", amount = 500}
    },
    results = {{type="item", name="grenade", amount=1}},
    auto_recycle = false
  },
  {
    type = "recipe",
    name = "resin-explosives",
    icon = "__wayward-seas__/graphics/icons/resin-explosives.png",
    category = "organic-or-chemistry",
    order = "b[chemistry]-e[explosives]-b",
    crafting_machine_tint =
    {
      primary = {r = 0.968, g = 0.381, b = 0.259, a = 1.000}, -- #f66142ff
      secondary = {r = 0.892, g = 0.664, b = 0.534, a = 1.000}, -- #e3a988ff
      tertiary = {r = 1.000, g = 0.978, b = 0.513, a = 1.000}, -- #fff982ff
      quaternary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000}, -- #352b03ff
    },
    energy_required = 4,
    enabled = false,
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    ingredients =
    {
      {type = "item", name = "sulfur", amount = 1},
      {type = "item", name = "carbon", amount = 2},
      {type = "fluid", name = "gleba-resin", amount = 200}
    },
    results = {{type="item", name="explosives", amount=2}},
    allow_productivity = true,
    auto_recycle = false
  },
  {
    type = "recipe",
    name = "resin-rocket",
    icon = "__wayward-seas__/graphics/icons/resin-rocket.png",
    order = "d[rocket-launcher]-a[basic]-b",
    enabled = false,
    surface_conditions =
    {
      {
        property = "pressure",
        min = 2000,
        max = 2000
      }
    },
    energy_required = 8,
    category = "crafting-with-fluid",
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 3},
      {type = "fluid", name = "gleba-resin", amount = 150}
    },
    results = {{type="item", name="rocket", amount=1}},
    auto_recycle = false
  },
  {
    type = "technology",
    name = "resin-tech",
    icon = "__wayward-seas__/graphics/technology/resin-tech.png",
    icon_size = 256,
    prerequisites = {"agriculture","military-2"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "gleba-resin"
      },
      {
        type = "unlock-recipe",
        recipe = "resin-grenade"
      },
      {
        type = "unlock-recipe",
        recipe = "resin-explosives"
      }
    },
    research_trigger =
    {
      type = "craft-item",
      item = "copper-bacteria",
      count = 100
    },
  },
  {
    type = "technology",
    name = "resin-rocketry",
    icon = "__wayward-seas__/graphics/technology/resin-rocketry.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "resin-rocket"
      }
    },
    prerequisites = {"rocketry", "resin-tech"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 20
    }
  },
}
local resin_incineration = {type = "gleba-resin", damage_modifier = 1.2}
table.insert(data.raw["fluid-turret"]["flamethrower-turret"].attack_parameters.fluids,resin_incineration)