from_surface = surface_create(room_width, room_height);
to_surface = surface_create(room_width, room_height);
t = 0.0;
target_room = -1;
fade_length = 2.0;
in_target = false;
shaders = [
  shdr_angular,
  shdr_bowtie,
  shdr_burn,
  shdr_butterfly_wave,
  shdr_caleidoscope,
  shdr_circle_crop,
  shdr_circle_open,
  shdr_color_distance,
  shdr_color_phase,
  shdr_crazy_parametric,
  shdr_cross_hatch,
  shdr_cross_warp,
  shdr_cross_zoom,
  shdr_cube,
  shdr_directional,
  shdr_directional_warp,
  shdr_doom,
  shdr_doorway,
  shdr_dreamy,
  shdr_dreamy_zoom,
  shdr_fade,
  shdr_fade_color,
  shdr_fade_grayscale,
  shdr_flye_eye,
  shdr_glitch_displace,
  shdr_glitch_memories,
  shdr_grid_flip,
  shdr_heart,
  shdr_hexagonalize,
  shdr_leaf,
  shdr_linear_blur,
  shdr_luminance_melt,
  shdr_morph,
  shdr_mosaic,
  shdr_multiply_blend,
  shdr_perlin,
  shdr_pin_wheel,
  shdr_pixelize,
  shdr_polar_function,
  shdr_polka_dots_curtain,
  shdr_radial,
  shdr_random_squares,
  shdr_ripple,
  shdr_rotate_scale_face,
  shdr_simple_zoom,
  shdr_squares_wire,
  shdr_squeeze,
  shdr_swap,
  shdr_swirl,
  shdr_undulating_burnout,
  shdr_water_drop,
  shdr_wind,
  shdr_window_blinds,
  shdr_window_slice,
  shdr_zoom_in_circles,
];

defaults = [
  { starting_angle_f: 90.0}, // shdr_angular
  { vertical_b: false }, // shdr_bowtie
  { color_vec3: [0.9, 0.4, 0.2] }, // shdr_burn
  { amplitude_f: 1.0, waves_f: 30.0, color_separation: 0.3 }, // shdr_butterfly_wave
  { speed_f: 1.0, angle_f: 1.0, power_f: 1.5 }, // shdr_caleidoscope
  { bgcolor_vec4: [0.0, 0.0, 0.0, 1.0] }, // shdr_circle_crop
  { smoothness_f: 0.3, opening_b: true }, // shdr_circle_open
  { power_f: 5.0 }, // shdr_color_distance
  { from_step_vec4: [0.0, 0.2, 0.4, 0.0], to_step_vec4: [0.6, 0.8, 1.0, 1.0]}, // shdr_color_phase
  { a_f : 4.0, b_f: 1.0, amplitude_f: 120.0, smoothness_f: 0.1 }, // shdr_crazy_parametric
  { center_vec2: [0.5, 0.5], threshold_f: 3.0, fade_edge_f: 0.1 }, // shdr_cross_hatch
  {}, // shdr_cross_warp
  { strength_f: 0.4 }, // shdr_cross_zoom
  { persp_f: 0.7, unzoom_f: 0.3, reflection_f: 0.4, floating_f: 3.0 }, // shdr_cube
  { direction_vec2: [1, 0] }, // shdr_directional
  { direction_vec2: [-1.0, 1.0] }, // shdr_directional_warp
  { bars_i: 30, amplitude_f: 2.0, noise_f: 0.1, frequency_f: 0.5, drip_scale_f: 0.5 }, // shdr_doom
  { reflection_f: 0.4, perspective_f: 0.4, depth_f: 3.0 }, // shdr_doorway
  {}, // shdr_dreamy
  { rotation_f: 6.0, scale_f: 1.2 }, // shdr_dreamy_zoom
  {}, // shdr_fade
  { color_vec3: [0.0, 0.0, 0.0], color_phase_f: 0.4 }, // shdr_fade_color
  { intensity_f: 0.3 }, // shdr_fade_grayscale
  { size_f: 0.04, zoom_f: 50.0, color_separation_f: 0.3 }, // shdr_flye_eye
  {}, // shdr_glitch_displace
  {}, // shdr_glitch_memories
  { size_vec2: [4.0, 4.0], pause_f: 0.1, divider_width: 0.05, bgcolor_vec4: [0.0, 0.0, 0.0, 1.0], randomness_f: 0.1 }, // shdr_grid_flip
  {}, // shdr_heart
  { steps_f: 50.0, horizontal_hexagons_f: 20.0 }, // shdr_hexagonalize
  {}, // shdr_leaf
  { intensity_f: 0.1 }, // shdr_linear_blur
  { up_b: true, threshold_f: 0.8, above_b: false }, // shdr_luminance_melt
  { strength_f: 0.1 }, // shdr_morph
  { endx_i: 2, endy_i: -1 }, // shdr_mosaic
  {}, // shdr_multiply_blend
  { scale_f: 4.0, smoothness_f: 0.01, seed_f: 12.9898 }, // shdr_perlin
  { speed_f: 2.0 }, // shdr_pin_wheel
  { squares_min_vec2: [20.0, 20.0], steps_f: 50.0 }, // shdr_pixelize
  { segments_i: 5 }, // shdr_polar_function
  { dots_f: 20.0 }, // shdr_polka_dots_curtain
  { smoothness_f: 1.0 }, // shdr_radial
  { size_vec2: [10.0, 10.0], smoothness_f: 0.5 }, // shdr_random_squares
  { amplitude_f: 100.0, speed_f: 50.0 }, // shdr_ripple
  { center_vec2: [0.5, 0.5], rotations_f: 1, scale_f: 8.0, back_color_vec4: [0.15, 0.15, 0.15, 1.0] }, // shdr_rotate_scale_face
  { zoom_quickness_f: 0.8 }, // shdr_simple_zoom
  { squares_vec2: [10.0, 10.0], direction_vec2: [1.0, -0.5], smoothness_f: 1.6 }, // shdr_squares_wire
  { color_separation_f: 0.04 }, // shdr_squeeze
  { reflection_f: 0.4, perspective_f: 0.2, depth_f: 3.0 }, // shdr_swap
  {}, // shdr_swirl
  { smoothness_f: 0.03, center_vec2: [0.5, 0.5], color_vec3: [0.0, 0.0, 0.0] }, // shdr_undulating_burnout
  { amplitude_f: 30.0, speed_f: 30.0 }, // shdr_water_drop
  { size_f: 0.2 }, // shdr_wind
  {}, // shdr_window_blinds
  { count_f: 10.0, smoothness_f: 0.5 }, // shdr_window_slice
  {}, // shdr_zoom_in_circles  
];

shader = shaders[0];
params = defaults[0];
uniforms = [];
progress = -1;

set_type = function (type, p) { 
    var idx = type % array_length(shaders);
    shader = shaders[idx];
    params = defaults[idx];
    progress = shader_get_uniform(shader, "progress");
    uniforms = [];
    
    var keys = variable_struct_get_names(p);
    for (var i = 0; i < array_length(keys); i++) {
        var key = keys[i];
        var val = p[$ key];
        params[$ key] = val;
    }
    
    keys = variable_struct_get_names(params);
    for (var i = 0; i < array_length(keys); i++) {
        var key = keys[i];
        var val = params[$ key];
        
        if (string_ends_with(key, "_b")) {
            var uniform_name = string_delete(key, string_length(key)-1, 2);
            var loc = shader_get_uniform(shader, uniform_name);
            array_push(uniforms, [shader_set_uniform_i, loc, [val ? 1 : 0]]);
        } else if (string_ends_with(key, "_i")) {
            var uniform_name = string_delete(key, string_length(key)-1, 2);
            var loc = shader_get_uniform(shader, uniform_name);
            array_push(uniforms, [shader_set_uniform_i, loc, [val]]);
        } else if (string_ends_with(key, "_f")) {
            var uniform_name = string_delete(key, string_length(key)-1, 2);
            var loc = shader_get_uniform(shader, uniform_name);
            array_push(uniforms, [shader_set_uniform_f, loc, [val]]);
        } else if (string_ends_with(key, "_vec2")) {
            var uniform_name = string_delete(key, string_length(key)-4, 5);
            var loc = shader_get_uniform(shader, uniform_name);
            array_push(uniforms, [shader_set_uniform_f, loc, val]);
        } else if (string_ends_with(key, "_vec3")) {
            var uniform_name = string_delete(key, string_length(key)-4, 5);
            var loc = shader_get_uniform(shader, uniform_name);
            array_push(uniforms, [shader_set_uniform_f, loc, val]);
        } else if (string_ends_with(key, "_vec4")) {
            var uniform_name = string_delete(key, string_length(key)-4, 5);
            var loc = shader_get_uniform(shader, uniform_name);
            array_push(uniforms, [shader_set_uniform_f, loc, val]);
        }        
    }
    
    array_push(uniforms, [shader_set_uniform_i, shader_get_uniform(shader, "from_tex"), [0]]);
    array_push(uniforms, [shader_set_uniform_i, shader_get_uniform(shader, "to_tex"), [1]]);
    array_push(uniforms, [shader_set_uniform_f, shader_get_uniform(shader, "ratio"), [room_width / room_height]]);
};
