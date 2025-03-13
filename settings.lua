data:extend{
    {
        type = "bool-setting",
        name = "gleba_start_faster_rockets",
        setting_type = "startup",
        default_value = true,
        order = "c-a"
    },
    {
        type = "int-setting",
        name = "pentapod_evo_curve",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 0,
        maximum_value = 100,
        order = "c-b"
    },
    {
        type = "bool-setting",
        name = "always_evo_curve",
        setting_type = "startup",
        default_value = false,
        order = "c-c"
    },
    {
        type = "bool-setting",
        name = "enable_excav_brace",
        setting_type = "startup",
        default_value = false,
        order = "c-d"
    },
    {
        type = "int-setting",
        name = "excav_brace_yield",
        setting_type = "startup",
        default_value = 40,
        minimum_value = 10,
        maximum_value = 100,
        order = "c-e"
    },
    {
        type = "int-setting",
        name = "world_gen_revision",
        setting_type = "startup",
        default_value = 2,
        allowed_values = {1, 2},
        order = "c-f"
    },
    {
        type = "bool-setting",
        name = "enable_ws_worldgen",
        setting_type = "startup",
        default_value = true,
        order = "c-g"
    },
    {
        type = "bool-setting",
        name = "soil_fertility_tweaks",
        setting_type = "startup",
        default_value = true,
        order = "c-h"
    },
}