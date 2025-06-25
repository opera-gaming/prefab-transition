enum TransitionType {
    kBowTie,
    kCrossZoom,
    kDirectional,
    kDreamyZoom,
    kGlitchMemories,
    kHexagonalze,
    kLinearBlur,
    kLuminanceMelt,
    kPinWheel,
    kPolkaDotsCurtain,
    kRadial,
    kSimpleZoom,
    kWaterDrop,
    kWindowSlice
};

function room_goto_transition(room, type, time, params) {
    if (!variable_global_exists("active_transition") || global.active_transition == -1) {
        global.active_transition = instance_create_layer(0,0, "Instances", obj_transition);
        global.active_transition.target_room = room;
        global.active_transition.fade_length = time;
        global.active_transition.set_type(type, params);
    }
}