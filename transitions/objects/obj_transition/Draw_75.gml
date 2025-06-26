surface_reset_target();
if (in_target) {
    shader_set(shader);
    
    texture_set_stage(0, surface_get_texture(from_surface));
    texture_set_stage(1, surface_get_texture(to_surface));
    shader_set_uniform_i(shader_get_uniform(shader, "from_tex"), 0);
    shader_set_uniform_i(shader_get_uniform(shader, "to_tex"), 1);
    shader_set_uniform_f(shader_get_uniform(shader, "progress"), clamp(t / fade_length, 0, 1));
    shader_set_uniform_f(shader_get_uniform(shader, "ratio"), room_width / room_height);
    
    var keys = variable_struct_get_names(params);
    for (var i = 0; i < array_length(keys); i++) {
        var key = keys[i];
        var val = params[$ key];
    
        if (string_ends_with(key, "_b")) {
            var uniform_name = string_delete(key, string_length(key)-1, 2);
            var loc = shader_get_uniform(shader, uniform_name);
            shader_set_uniform_i(loc, val ? 1 : 0);
        } else if (string_ends_with(key, "_i")) {
            var uniform_name = string_delete(key, string_length(key)-1, 2);
            var loc = shader_get_uniform(shader, uniform_name);
            shader_set_uniform_i(loc, val);
        } else if (string_ends_with(key, "_f")) {
            var uniform_name = string_delete(key, string_length(key)-1, 2);
            var loc = shader_get_uniform(shader, uniform_name);
            shader_set_uniform_f(loc, val);
        } else if (string_ends_with(key, "_vec2")) {
            var uniform_name = string_delete(key, string_length(key)-4, 5);
            var loc = shader_get_uniform(shader, uniform_name);
            shader_set_uniform_f(loc, val[0], val[1]);
        } else if (string_ends_with(key, "_vec3")) {
            var uniform_name = string_delete(key, string_length(key)-4, 5);
            var loc = shader_get_uniform(shader, uniform_name);
            shader_set_uniform_f(loc, val[0], val[1], val[2]);
        } else if (string_ends_with(key, "_vec4")) {
            var uniform_name = string_delete(key, string_length(key)-4, 5);
            var loc = shader_get_uniform(shader, uniform_name);
            shader_set_uniform_f(loc, val[0], val[1], val[2], val[3]);
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
