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
function room_goto_transition(room, type, time, params) {
    if (!variable_global_exists("active_transition") || global.active_transition == -1) {
        global.active_transition = instance_create_layer(0,0, "Instances", obj_transition);
        global.active_transition.target_room = room;
        global.active_transition.fade_length = time;
        global.active_transition.set_type(type, params);
    }
}

#export room_goto_transition