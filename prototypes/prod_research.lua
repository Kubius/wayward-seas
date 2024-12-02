data:extend{
    {
    type = "technology",
    name = "fungal-productivity-1",
    icons = util.technology_icon_constant_productivity("__wayward-seas__/graphics/technology/fungal-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "cuttlepop-processing",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "sunnycomb-processing",
        change = 0.1
      }
    },
    prerequisites = {"agriculture", "logistic-science-pack"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 15
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "fungal-productivity-2",
    icons = util.technology_icon_constant_productivity("__wayward-seas__/graphics/technology/fungal-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "cuttlepop-processing",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "sunnycomb-processing",
        change = 0.1
      }
    },
    prerequisites = {"fungal-productivity-1", "agricultural-science-pack"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"agricultural-science-pack", 1},
      },
      time = 20
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "fungal-productivity-3",
    icons = util.technology_icon_constant_productivity("__wayward-seas__/graphics/technology/fungal-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "cuttlepop-processing",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "sunnycomb-processing",
        change = 0.1
      }
    },
    prerequisites = {"fungal-productivity-2", "chemical-science-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"agricultural-science-pack", 1},
      },
      time = 30
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "fungal-productivity-4",
    icons = util.technology_icon_constant_productivity("__wayward-seas__/graphics/technology/fungal-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "cuttlepop-processing",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "sunnycomb-processing",
        change = 0.1
      }
    },
    prerequisites = {"fungal-productivity-3", "production-science-pack"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"agricultural-science-pack", 1},
      },
      time = 45
    },
    upgrade = true
  },
  {
    type = "technology",
    name = "fungal-productivity-5",
    icons = util.technology_icon_constant_productivity("__wayward-seas__/graphics/technology/fungal-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "cuttlepop-processing",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "sunnycomb-processing",
        change = 0.1
      }
    },
    prerequisites = {"fungal-productivity-4", "space-science-pack"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1},
      },
      time = 60
    },
    upgrade = true
    },
}