enum playerAnimation {
   idle = spr_player_idle,
   walk = spr_player_walk,
   runreload = spr_player_runreload
   }
beginMoving = true;
playerSprinting = false;
cooldown = 0;
cooldownTimer = 4

currentAnimation = playerAnimation.idle;

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
