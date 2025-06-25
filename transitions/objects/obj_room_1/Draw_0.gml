draw_set_color(make_color_rgb(0,115,107));
draw_circle(room_width*0.5 + sin(t) * 200, room_height * 0.5 + cos(t) * 200, 100, false);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(room_width*0.5, room_height*0.5, "press mouse to transition to room 2");
