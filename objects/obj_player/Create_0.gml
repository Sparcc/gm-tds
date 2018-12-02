thisInstance = instance_find(obj_player,0);
show_debug_message(script_execute(testScript,"hi"));
show_debug_message("This instance ID is"+string(thisInstance));
// TODO: Use ds_map instead to make more dynamic
enum playerAnimation {
   idle = spr_player_idle,
   walk = spr_player_walk,
   runreload = spr_player_runreload
   }
   
enum playerGunRecoil {
	uzi = 1.5
}

enum playerGunRecoilCooldown {
	uzi = 3
}

enum playerGunMaxSpread {
	uzi = 8
}

enum playerGunMinSpread {
	uzi = 1.1
}

enum playerReloadSize {
	uzi = 20
}

//view_object[0]=obj_player;//object to follow
//obj_main_game_camera.x = x;
//obj_main_game_camera.y = y;
//show_debug_message("camera x = "+string(obj_main_game_camera.x));


playerMoving = true;
playerSprinting = false;
playerAiming = false;
cooldown = 0;
cooldownTimer = 5;
selectedWeapon = "uzi";
currentAnimation = playerAnimation.idle;
playerRecoilIntensity = playerGunRecoil.uzi;
playerRecoilCooldownIntensity = playerGunRecoilCooldown.uzi;
playerRecoilLimit = playerGunMaxSpread.uzi;
playerRecoilInit = playerGunMinSpread.uzi;
playerRecoilCount = 0; // Not used yet
playerCurrentRecoil = 0;
playerRecoilTimer = 0;
playerRecoilSpreadCone = 0;

playerAmmoReloadSize = playerReloadSize.uzi;
playerAmmo = playerAmmoReloadSize;
sprite_index = currentAnimation //Default animation
image_speed = 1;

//cursor_sprite = spr_crosshair;

// Part of fancy movement script I stole from the web
enum inputKeyElementID {
	d_key = 0, 
	w_key = 1,
	a_key = 2,
	s_key = 3
}
movement_inputs[1] = ord("W");
movement_inputs[3] = ord("S");
movement_inputs[2] = ord("A");
movement_inputs[0] = ord("D");

moveSpeedDefault = 150;
moveSpeed = moveSpeedDefault;
moveSpeedSprintMult = 1.8;

canShoot = false;
isReloading = false;

// Collisions Tutorial: https://www.youtube.com/watch?v=7NHJ6A34V6I
var l = layer_get_id("collision_map");
tilemap = layer_tilemap_get_id(l);

// Sprite Information
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

move_speed = 9;

debugTimer[0] = 0;
