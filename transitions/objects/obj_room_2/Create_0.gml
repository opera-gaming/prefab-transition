if (!variable_global_exists("my_video")) {
    global.my_video = video_open("cover_assault.mp4");
    video_enable_loop(true);
}
