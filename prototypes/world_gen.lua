data:extend{
    {
        type = "noise-expression",
        name = "wayward_seas_gleba_prep",
        expression = "(gleba_tri_ridge * (0.7 + (var('control:gleba_water:size') - low_scalar) / 8 )) * 2 - 0.2 * ridges_small_noise + low_scalar",
        local_expressions = {
            ridges_small_noise = "abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1000000, octaves = 3, input_scale = 1/60})",
            low_scalar = "min(var('control:gleba_water:size'),0.85) - 0.85" --reemphasizes height at low water scales for closer-to-vanilla generation
        }
    },
    {
        type = "noise-expression",
        name = "wayward_seas_lowstone",
        expression = "gleba_select(gleba_elevation_common+14, 0, 7, 0.5, 0, 1)"
    }
}

data.raw["noise-expression"]["gleba_spawner"].expression = "max(0.01 * gleba_starting_enemies, max(min(0.02, enemy_autoplace_base(0, 8)), min(0.001, gleba_fertile_spots_coastal * 5000 - gleba_biome_mask_green * 25000)) * (distance > 500)) * gleba_above_deep_water_mask"
data.raw["noise-expression"]["gleba_starting_enemies"].expression = "0"
data.raw["noise-expression"]["gleba_stone_richness"].expression = "1000 * max(starting, gleba_simple_spot(1000, 12 * size ^ 0.5, 220 / frequency ^ 0.5, 1) * max(gleba_highland*5, gleba_midland_aux_2, wayward_seas_lowstone + wayward_seas_lowstone * 0.5 * (gleba_elevation_common < gleba_deep_water_level))) * richness / size"

if settings.startup["soil_fertility_tweaks"].value then
    data.raw["noise-expression"]["gleba_fertile_spots_coastal_raw"].expression = "spot_noise{ x = x + wobble_noise_x * 15,\z
                y = y + wobble_noise_y * 15,\z
                seed0 = map_seed,\z
                seed1 = 1,\z
                candidate_spot_count = 80,\z
                suggested_minimum_candidate_point_spacing = 128,\z
                skip_span = 1,\z
                skip_offset = 0,\z
                region_size = 1024,\z
                density_expression = 80,\z
                spot_quantity_expression = max(1000, 1000 * var('control:gleba_water:size')),\z
                spot_radius_expression = max(24, 10 + 22 * var('control:gleba_water:size')),\z
                hard_region_target_quantity = 0,\z
                spot_favorability_expression = 60,\z
                basement_value = -0.5,\z
                maximum_spot_basement_radius = 128}"

    data.raw["noise-expression"]["gleba_fertile_spots_coastal"].expression = "max(min(1, gleba_starting_fertile * 4), min(exclude_middle, gleba_fertile_spots_coastal_raw) - \z
        max(0, -(elevation + max(2, 2 * var('control:gleba_water:size')) ) / 5) - max(0, (elevation - max(10, 6 + 4 * var('control:gleba_water:size')) ) / 5))"
    data.raw["noise-expression"]["gleba_fertile_spots_coastal"].local_expressions["exclude_middle"] = "(distance / gleba_starting_area_multiplier / 150) - 2.2 + fuzz"
    data.raw["noise-expression"]["gleba_fertile_spots_coastal"].local_expressions["fuzz"] = "\z
        multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 80808, octaves = 2, input_scale = 1/16}"

    data.raw["noise-expression"]["gleba_fertile_solid"].expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 2000000, octaves = 2, input_scale = 1/16}) * gleba_fertile_spots_coastal * max(2, 0.2 + 1.6 * sqrt(var('control:gleba_water:size')))"
end

if settings.startup["world_gen_revision"].value == 2 then
    data.raw["noise-expression"]["gleba_starting_area_multiplier"].expression = "0.25"
    data.raw["noise-expression"]["gleba_elevation_common"].local_expressions["ridges"] = "-(wayward_seas_gleba_prep + 1 + 0.35 * sqrt(var('control:gleba_water:size')))"
    data.raw["noise-expression"]["gleba_elevation_common"].local_expressions["ridge_terrace"] = "terrace{value = min(200 + 100 * (var('control:gleba_water:size') ^ 2), 300, 110 + ridges * 1000), offset = 60, width = 60 * max(4 - var('control:gleba_water:size')*3,1), strength = min(0.2,0.5 * var('control:gleba_water:size'))}"
    data.raw["noise-expression"]["gleba_elevation_common"].local_expressions["starting_highland_main"] = "starting_spot_at_angle{ angle = gleba_starting_angle + 95 * gleba_starting_direction,\z
                                                            distance = 100 * 0.5,\z
                                                            radius = 130 * 0.5,\z
                                                            x_distortion = gleba_wobble_x * 15,\z
                                                            y_distortion = gleba_wobble_x * 15}"
    data.raw["noise-expression"]["gleba_elevation_common"].local_expressions["starting_highland_small"] = "starting_spot_at_angle{angle = gleba_starting_angle + 40 * gleba_starting_direction,\z
                                                            distance = 130 * 0.5,\z
                                                            radius = 65 * 0.5,\z
                                                            x_distortion = gleba_wobble_x * 15,\z
                                                            y_distortion = gleba_wobble_x * 15}"
else
    data.raw["noise-expression"]["gleba_starting_area_multiplier"].expression = "0.2"
    data.raw["noise-expression"]["gleba_elevation_common"].local_expressions["ridges"] = "-(wayward_seas_gleba_prep + 0.9 + 0.4 * sqrt(var('control:gleba_water:size')))"
    data.raw["noise-expression"]["gleba_elevation_common"].local_expressions["ridge_terrace"] = "terrace{value = min(80, 110 + ridges * 1000), offset = 60, width = 60, strength = min(0.2,0.5 * var('control:gleba_water:size'))}"
end

--data.raw["noise-expression"]["gleba_shallows"].expression = "gleba_select(gleba_elevation, -3.5, -2, 0.4, 0, 1)"