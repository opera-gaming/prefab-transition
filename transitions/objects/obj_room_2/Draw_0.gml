var data = video_draw();
if (data[0] == 0) { 
    draw_surface_stretched(data[1], 0, 0, room_width, room_height);
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(room_width*0.5, room_height*0.5, "press mouse to transition to room 1");