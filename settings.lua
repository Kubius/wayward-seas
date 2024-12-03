data:extend{
    {
        type = "int-setting",
        name = "world_gen_revision",
        setting_type = "startup",
        default_value = 2,
        allowed_values = {1, 2},
        order = "c-a"
    },
    {
        type = "bool-setting",
        name = "enable_ws_worldgen",
        setting_type = "startup",
        default_value = true,
        order = "c-b"
    },
}