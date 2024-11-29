data:extend{
    {
        type = "noise-expression",
        name = "wayward_seas_gleba_prep",
        expression = "(gleba_tri_ridge * (0.7 + (var('control:gleba_water:size') - low_scalar) / 8 )) * 2 - 0.2 * ridges_small_noise + low_scalar",
        local_expressions = {
            ridges_small_noise = "abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/60})",
            low_scalar = "min(var('control:gleba_water:size'),1) - 1" --reemphasizes height at low water scales for closer-to-vanilla generation
        }
    },
    {
        type = "noise-expression",
        name = "wayward_seas_lowstone",
        expression = "gleba_select(gleba_elevation_common+14, 0, 7, 0.5, 0, 1)"
    },
}

data.raw["noise-expression"]["gleba_starting_area_multiplier"].expression = "0.2"
data.raw["noise-expression"]["gleba_starting_enemies"].expression = "0"
data.raw["noise-expression"]["gleba_elevation_common"].local_expressions["ridges"] = "-(wayward_seas_gleba_prep + 0.9 + 0.4 * sqrt(var('control:gleba_water:size')))"
data.raw["noise-expression"]["gleba_elevation_common"].local_expressions["ridge_terrace"] = "terrace{value = min(80, 110 + ridges * 1000), offset = 60, width = 60, strength = min(0.2,0.5 * var('control:gleba_water:size'))}"
data.raw["noise-expression"]["gleba_stone_richness"].expression = "1000 * max(starting, gleba_simple_spot(1000, 12 * size ^ 0.5, 220 / frequency ^ 0.5, 1) * max(gleba_highland*5, gleba_midland_aux_2, wayward_seas_lowstone + 0.5 * (gleba_elevation_common < gleba_deep_water_level))) * richness / size"

--data.raw["noise-expression"]["gleba_shallows"].expression = "gleba_select(gleba_elevation, -3.5, -2, 0.4, 0, 1)"