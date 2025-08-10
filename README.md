# transition

GameMaker prefab for `room_goto_transition()` that captures the screen content in a surface, goes to the specified room, renders that room to a surface and uses the two surfaces to render a transition.

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
  { starting_angle_f: 90.0}, // kAngular - shdr_angular
  { shadow_colour_vec4: [0.0,0.0,0.0,0.6], shadow_height_f: 0.075, bounces_f: 3.0 }, // kBounce - shdr_bounce
  { vertical_b: false }, // kBowTie - shdr_bowtie
  { color_vec3: [0.9, 0.4, 0.2] }, // kBurn - shdr_burn
  { amplitude_f: 1.0, waves_f: 30.0, color_separation: 0.3 }, // kButterflyWave - shdr_butterfly_wave
  { speed_f: 1.0, angle_f: 1.0, power_f: 1.5 }, // kCaleidoscope - shdr_caleidoscope
  { bgcolor_vec4: [0.0, 0.0, 0.0, 1.0] }, // kCircleCrop - shdr_circle_crop
  { smoothness_f: 0.3, opening_b: true }, // kCircleOpen - shdr_circle_open
  { power_f: 5.0 }, // kColorDistance - shdr_color_distance
  { from_step_vec4: [0.0, 0.2, 0.4, 0.0], to_step_vec4: [0.6, 0.8, 1.0, 1.0]}, // kColorPhase - shdr_color_phase
  { a_f : 4.0, b_f: 1.0, amplitude_f: 120.0, smoothness_f: 0.1 }, // kCrazyParametric - shdr_crazy_parametric
  { center_vec2: [0.5, 0.5], threshold_f: 3.0, fade_edge_f: 0.1 }, // kCrossHatch - shdr_cross_hatch
  {}, // kCrossWarp - shdr_cross_warp
  { strength_f: 0.4 }, // kCrossZoom - shdr_cross_zoom
  { persp_f: 0.7, unzoom_f: 0.3, reflection_f: 0.4, floating_f: 3.0 }, // kCube - shdr_cube
  { direction_vec2: [1, 0] }, // kDirectional - shdr_directional
  { direction_vec2: [-1.0, 1.0] }, // kDirectionalWarp - shdr_directional_warp
  { bars_i: 30, amplitude_f: 2.0, noise_f: 0.1, frequency_f: 0.5, drip_scale_f: 0.5 }, // kDoom - shdr_doom
  { reflection_f: 0.4, perspective_f: 0.4, depth_f: 3.0 }, // kDoorway - shdr_doorway
  {}, // kDreamy - shdr_dreamy
  { rotation_f: 6.0, scale_f: 1.2 }, // kDreamyZoom - shdr_dreamy_zoom
  {}, // kFade - shdr_fade
  { color_vec3: [0.0, 0.0, 0.0], color_phase_f: 0.4 }, // kFadeColor - shdr_fade_color
  { intensity_f: 0.3 }, // kFadeGrayscale - shdr_fade_grayscale
  { size_f: 0.04, zoom_f: 50.0, color_separation_f: 0.3 }, // kFlyeEye - shdr_flye_eye
  {}, // kGlitchDisplace - shdr_glitch_displace
  {}, // kGlitchMemories - shdr_glitch_memories
  { size_vec2: [4.0, 4.0], pause_f: 0.1, divider_width: 0.05, bgcolor_vec4: [0.0, 0.0, 0.0, 1.0], randomness_f: 0.1 }, // kGridFlip - shdr_grid_flip
  {}, // kHeart - shdr_heart
  { steps_f: 50.0, horizontal_hexagons_f: 20.0 }, // kHexagonalize - shdr_hexagonalize
  {}, // kLeaf - shdr_leaf
  { intensity_f: 0.1 }, // kLinearBlur - shdr_linear_blur
  { up_b: true, threshold_f: 0.8, above_b: false }, // kLuminanceMelt - shdr_luminance_melt
  { strength_f: 0.1 }, // kMorph - shdr_morph
  { endx_i: 2, endy_i: -1 }, // kMosaic - shdr_mosaic
  {}, // kMultiplyBlend - shdr_multiply_blend
  { scale_f: 4.0, smoothness_f: 0.01, seed_f: 12.9898 }, // kPerlin - shdr_perlin
  { speed_f: 2.0 }, // kPinWheel - shdr_pin_wheel
  { squares_min_vec2: [20.0, 20.0], steps_f: 50.0 }, // kPixelize - shdr_pixelize
  { segments_i: 5 }, // kPolarFunction - shdr_polar_function
  { dots_f: 20.0 }, // kPolkaDotsCurtain - shdr_polka_dots_curtain
  { smoothness_f: 1.0 }, // kRadial - shdr_radial
  { size_vec2: [10.0, 10.0], smoothness_f: 0.5 }, // kRandomSquares - shdr_random_squares
  { amplitude_f: 100.0, speed_f: 50.0 }, // kRipple - shdr_ripple
  { center_vec2: [0.5, 0.5], rotations_f: 1, scale_f: 8.0, back_color_vec4: [0.15, 0.15, 0.15, 1.0] }, // kRotateScaleFace - shdr_rotate_scale_face
  { zoom_quickness_f: 0.8 }, // kSimpleZoom - shdr_simple_zoom
  { squares_vec2: [10.0, 10.0], direction_vec2: [1.0, -0.5], smoothness_f: 1.6 }, // kSquaresWire - shdr_squares_wire
  { color_separation_f: 0.04 }, // kSqueeze - shdr_squeeze
  { reflection_f: 0.4, perspective_f: 0.2, depth_f: 3.0 }, // kSwap - shdr_swap
  {}, // kSwirl - shdr_swirl
  { smoothness_f: 0.03, center_vec2: [0.5, 0.5], color_vec3: [0.0, 0.0, 0.0] }, // kUndulatingBurnout - shdr_undulating_burnout
  { amplitude_f: 30.0, speed_f: 30.0 }, // kWaterDrop - shdr_water_drop
  { size_f: 0.2 }, // kWind - shdr_wind
  {}, // kWindowBlinds - shdr_window_blinds
  { count_f: 10.0, smoothness_f: 0.5 }, // kWindowSlice - shdr_window_slice
  {}, // kZoomInCircles - shdr_zoom_in_circles  
];
```

## License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.

### Third-Party Shader Notices (MIT)

The following shader effects are based on or derived from `.glsl` files in the [gl-transitions/gl-transitions](https://github.com/gl-transitions/gl-transitions/tree/master/transitions) repository, each licensed under the MIT License:

- `shdr_angular` — [angular.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/angular.glsl)  
- `shdr_bounce` — [bounce.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/bounce.glsl)  
- `shdr_bowtie` — [bowtie.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/bowtie.glsl)  
- `shdr_burn` — [filmBurn.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/filmBurn.glsl)  
- `shdr_butterfly_wave` — [butterflyWaveScrawler.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/butterflyWaveScrawler.glsl)  
- `shdr_caleidoscope` — [kaleidoscope.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/kaleidoscope.glsl)  
- `shdr_circle_crop` — [circleCrop.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/circleCrop.glsl)  
- `shdr_circle_open` — [circleOpen.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/circleOpen.glsl)  
- `shdr_color_distance` — [colorDistance.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/colorDistance.glsl)  
- `shdr_color_phase` — [colorPhase.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/colorPhase.glsl)  
- `shdr_crazy_parametric` — [crazyParametricFun.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/crazyParametricFun.glsl)  
- `shdr_cross_hatch` — [crosshatch.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/crosshatch.glsl)  
- `shdr_cross_warp` — [crosswarp.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/crosswarp.glsl)  
- `shdr_cross_zoom` — [crossZoom.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/crossZoom.glsl)  
- `shdr_cube` — [cube.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/cube.glsl)  
- `shdr_directional` — [directional.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/directional.glsl)  
- `shdr_directional_warp` — [directionalwarp.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/directionalwarp.glsl)  
- `shdr_doom` — [doomScreenTransition.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/doomScreenTransition.glsl)  
- `shdr_doorway` — [doorway.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/doorway.glsl)  
- `shdr_dreamy` — [dreamy.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/dreamy.glsl)  
- `shdr_dreamy_zoom` — [dreamyZoom.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/dreamyZoom.glsl)  
- `shdr_fade` — [fade.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/fade.glsl)  
- `shdr_fade_color` — [fadeColor.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/fadeColor.glsl)  
- `shdr_fade_grayscale` — [fadeGrayscale.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/fadeGrayscale.glsl)  
- `shdr_flye_eye` — [flyeye.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/flyeye.glsl)  
- `shdr_glitch_displace` — [glitchDisplace.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/glitchDisplace.glsl)  
- `shdr_glitch_memories` — [glitchMemories.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/glitchMemories.glsl)  
- `shdr_grid_flip` — [gridflip.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/gridflip.glsl)  
- `shdr_heart` — [heart.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/heart.glsl)  
- `shdr_hexagonalize` — [hexagonalize.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/hexagonalize.glsl)  
- `shdr_leaf` — [cannabisleaf.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/cannabisleaf.glsl)  
- `shdr_linear_blur` — [linearBlur.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/linearBlur.glsl)  
- `shdr_luminance_melt` — [luminance_melt.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/luminance_melt.glsl)  
- `shdr_morph` — [morph.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/morph.glsl)  
- `shdr_mosaic` — [mosaic.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/mosaic.glsl)  
- `shdr_multiply_blend` — [multiplyBlend.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/multiplyBlend.glsl)  
- `shdr_perlin` — [perlin.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/perlin.glsl)  
- `shdr_pin_wheel` — [pinwheel.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/pinwheel.glsl)  
- `shdr_pixelize` — [pixelize.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/pixelize.glsl)  
- `shdr_polar_function` — [polar_function.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/polar_function.glsl)  
- `shdr_polka_dots_curtain` — [polkaDotsCurtain.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/polkaDotsCurtain.glsl)  
- `shdr_radial` — [radial.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/radial.glsl)  
- `shdr_random_squares` — [randomsquares.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/randomsquares.glsl)  
- `shdr_ripple` — [ripple.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/ripple.glsl)  
- `shdr_rotate_scale_face` — [rotateScaleFade.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/rotateScaleFade.glsl)  
- `shdr_simple_zoom` — [simpleZoom.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/simpleZoom.glsl)  
- `shdr_squares_wire` — [squareswire.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/squareswire.glsl)  
- `shdr_squeeze` — [squeeze.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/squeeze.glsl)  
- `shdr_swap` — [swap.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/swap.glsl)  
- `shdr_swirl` — [swirl.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/swirl.glsl)  
- `shdr_undulating_burnout` — [undulatingBurnOut.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/undulatingBurnOut.glsl)  
- `shdr_water_drop` — [waterdrop.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/waterdrop.glsl)  
- `shdr_wind` — [wind.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/wind.glsl)  
- `shdr_window_blinds` — [windowblinds.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/windowblinds.glsl)  
- `shdr_window_slice` — [windowSlice.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/windowSlice.glsl)  
- `shdr_zoom_in_circles` — [zoomInCircles.glsl](https://github.com/gl-transitions/gl-transitions/blob/master/transitions/zoomInCircles.glsl)  
