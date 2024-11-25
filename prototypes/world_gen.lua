data:extend{
    {
        type = "noise-expression",
        name = "wayward_seas_gleba_prep",
        expression = "(gleba_tri_ridge * (0.7 + var('control:gleba_water:size') / 8)) * 2 - 0.2 * ridges_small_noise",
        local_expressions = {
            ridges_small_noise = "abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/60})",
        }
    },
--[[
    {
        type = "noise-expression",
        name = "wayward_seas_chisel",
        expression = "min(0.5 * delta_band,wayward_seas_gleba_prep * 10)",
        local_expressions = {
            alpha_band = "abs( (wayward_seas_gleba_prep - 4) - abs(wayward_seas_gleba_prep - 2) )",
            beta_band = "(wayward_seas_gleba_prep - 1) - abs(wayward_seas_gleba_prep - 1)",
            delta_band = "alpha_band + (beta_band * 2)"
        }
    },
]]
}

data.raw["noise-expression"]["gleba_starting_area_multiplier"].expression = "0.2"
data.raw["noise-expression"]["gleba_elevation_common"].local_expressions["ridges"] = "-(wayward_seas_gleba_prep + 0.9 + 0.4 * var('control:gleba_water:size'))"
data.raw["noise-expression"]["gleba_shallows"].expression = "gleba_select(gleba_elevation, -3.5, -2, 0.4, 0, 1)"