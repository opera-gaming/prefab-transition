surface_reset_target();
if (in_target) {
    shader_set(shader);
    
    texture_set_stage(0, surface_get_texture(from_surface));
    texture_set_stage(1, surface_get_texture(to_surface));
    shader_set_uniform_f(progress, clamp(t / fade_length, 0, 1));

    for (var j = 0; j < array_length(uniforms); ++j) {
        var u = uniforms[j];
        switch (array_length(u[2])) {
            case 1:
                script_execute(u[0], u[1], u[2][0]);
                break;
            case 2:
                script_execute(u[0], u[1], u[2][0], u[2][1]);
                break;
            case 3:
                script_execute(u[0], u[1], u[2][0], u[2][1], u[2][2]);
                break;
            default:
                script_execute(u[0], u[1], u[2][0], u[2][1], u[2][2], u[2][3]);
        }
    }
    
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_texture(-1, -1, 0, 0);
    draw_vertex_texture(1, -1, 1, 0);
    draw_vertex_texture(-1, 1, 0, 1);
    draw_vertex_texture(1, 1, 1, 1);
    draw_primitive_end();
    
    shader_reset();    
} else {
    in_target = true;
    room_goto(target_room);
}
