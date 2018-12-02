// Trying to resize view port

//view_hport[0] = window_get_height();
//view_wport[0] = window_get_width();

global.debugEnabled = false;
global.debugDoggles = false;
global.debugPlayer = false;
global.debugStreamFrequency = 4;
global.debugEventFrequency = 0;
global.mainCameraFollowing = obj_player;

window_set_min_width(640);
window_set_min_height(480);
window_set_max_width(2560);
window_set_max_height(1080);