
if (global.mainCameraFollowing == obj_player){
	global.mainCameraPosX = obj_player.x;
	global.mainCameraPosY = obj_player.y;
}else if(global.mainCameraFollowing == obj_crosshair){
	global.mainCameraPosX = obj_crosshair.x;
	global.mainCameraPosY = obj_crosshair.y;
}
