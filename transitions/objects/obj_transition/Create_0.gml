from_surface = surface_create(room_width, room_height);
to_surface = surface_create(room_width, room_height);
t = 0.0;
target_room = -1;
fade_length = 2.0;
in_target = false;
shaders = [
  shdr_bowtie,
  shdr_cross_zoom,
  shdr_directional,
  shdr_directional_warp,
  shdr_dreamy_zoom,
  shdr_glitch_memories,
  shdr_hexagonalize,
  shdr_linear_blur,
  shdr_luminance_melt,
  shdr_morph,
  shdr_perlin,
  shdr_pin_wheel,
  shdr_polka_dots_curtain,
  shdr_radial,
  shdr_simple_zoom,
  shdr_water_drop,
  shdr_window_slice,
];
defaults = [
  { vertical_b: false },
  { strength_f: 0.4 },
  { direction_vec2: [1, 0] },
  { direction_vec2: [-1.0, 1.0] },
  { rotation_f: 6.0, scale_f: 1.2 },
  {},
  { steps_f: 50.0, horizontal_hexagons_f: 20.0 },
  { intensity_f: 0.1 },
  { up_b: true, threshold_f: 0.8, above_b: false },
  { strength_f: 0.1 },
  { scale_f: 4.0, smoothness_f: 0.01, seed_f: 12.9898},
  { speed_f: 2.0 },
  { dots_f: 20.0 },
  { smoothness_f: 1.0 },
  { zoom_quickness_f: 0.8 },
  { amplitude_f: 30.0, speed_f: 30.0 },
  { count_f: 10.0, smoothness_f: 0.5 },
];
shader = shaders[0];
params = defaults[0];

set_type = function (type, p) {
  var idx = type % array_length(shaders);
  shader = shaders[idx];
  params = defaults[idx];
    
    var keys = variable_struct_get_names(p);
    for (var i = 0; i < array_length(keys); i++) {
        params[$ keys[i]] = p[$ keys[i]]
  }
};
