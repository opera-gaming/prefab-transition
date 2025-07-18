# transition

GameMaker prefab for `room_goto_transition()` that captures the screen content in a surface, goes to the specified room, renders that room to a surface and uses the two surfaces to render a transition.

The transitions are MIT shaders from https://gl-transitions.com
Thanks to the following shader authors:
```
@Flexi23, 0gust1, Adrian Purser, bobylito, dycm8009, Eke Péter,
Fabien Benetou, Fernando Kuteken, Gaëtan Renaudeau, gre,
Gunnar Roth, huynx, mandubian, Matt DesLauriers, mikolalysenko,
Mr Speaker, nwoeanhinnogaehr, Paweł Płóciennik, paniq,
P-Seebauer, pschroen, pthrasher, rectalogic, Rich Harris,
Sergey Kosarevsky, TimDonselaar, Xaychru, Zeh Fernando
```

[Try it on GX.games](https://gx.games/games/rhk5t6/transition/tracks/e6f33c97-7f84-4d47-a0eb-3d99dabb23c8/)

```js
/**
 * Transitions to another room using a specified visual effect.
 * If no transition is currently active, it creates one and sets its properties.
 * Example:
 * room_goto_transition(room_level2, TransitionType.kCircleCrop, 1.5, {});
 *
 * @param {Room} room - The target room to transition to.
 * @param {TransitionType} type - The visual transition effect to use.
 * @param {number} time - Duration of the transition in seconds.
 * @param {any} params - Optional parameters passed to configure the transition.
 */
function room_goto_transition(room, type, time, params);

/**
 * Enum representing the various screen transition effects available.
 * These can be used to define how the screen should animate when changing rooms.
 */
enum TransitionType {
    kAngular,
    kBounce,
    kBowTie,
    kBurn,
    kButterflyWave,
    kCaleidoscope,
    kCircleCrop,
    kCircleOpen,
    kColorDistance,
    kColorPhase,
    kCrazyParametric,
    kCrossHatch,
    kCrossWarp,
    kCrossZoom,
    kCube,
    kDirectional,
    kDirectionalWarp,
    kDoom,
    kDoorway,
    kDreamy,
    kDreamyZoom,
    kFade,
    kFadeColor,
    kFadeGrayscale,
    kFlyeEye,
    kGlitchDisplace,
    kGlitchMemories,
    kGridFlip,
    kHeart,
    kHexagonalize,
    kLeaf,
    kLinearBlur,
    kLuminanceMelt,
    kMorph,
    kMosaic,
    kMultiplyBlend,
    kPerlin,
    kPinWheel,
    kPixelize,
    kPolarFunction,
    kPolkaDotsCurtain,
    kRadial,
    kRandomSquares,
    kRipple,
    kRotateScaleFace,
    kSimpleZoom,
    kSquaresWire,
    kSqueeze,
    kSwap,
    kSwirl,
    kUndulatingBurnout,
    kWaterDrop,
    kWind,
    kWindowBlinds,
    kWindowSlice,
    kZoomInCircles,
};

defaults = [
  { starting_angle_f: 90.0}, // shdr_angular
  { shadow_colour_vec4: [0.0,0.0,0.0,0.6], shadow_height_f: 0.075, bounces_f: 3.0 }, // shdr_bounce
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
```