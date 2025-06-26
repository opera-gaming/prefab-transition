if (!variable_global_exists("fader_type")) {
    global.fader_type = TransitionType.kAngular;
} else {
    global.fader_type += 1;    
}
room_goto_transition(rm_room2, global.fader_type, 0.75, {});
