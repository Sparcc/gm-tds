for (var i = 0; i < array_length_1d(debugTimer); i++){
	debugTimer[i] += (delta_time/1000000);
}


// Orientation
direction = point_direction(x, y, mouse_x, mouse_y);
image_angle = direction;


// Player move animation
// Only change animation if not already reloading
if (!isReloading){
	if (beginMoving){
		currentAnimation = playerAnimation.walk
		sprite_index = currentAnimation;
		beginMoving = false;
	}else{
		sprite_index = playerAnimation.idle;
	}
}

// Player sprint check
if (playerSprinting){
//runSpeed = defaultSprintSpeed;
moveSpeed = moveSpeedDefault * moveSpeedSprintMult;
image_speed = 2;
}else{
//runSpeed = defaultRunSpeed;
moveSpeed = moveSpeedDefault;
image_speed = 1;
}

// Aiming and shooting
if (mouse_check_button(mb_left) && !isReloading)
{
	if(cooldown <= 0)
	{
		//spawn bullet and fire
		//instance_create_layer(x+10, y, "Instances", obj_bullet);
		
		//motion_add(point_direction(x,y,mouse_x,mouse_y)+180,5);
		instance_create_layer(x + lengthdir_x(30, image_angle), y + lengthdir_y(30, image_angle),"Instances", obj_bullet);
		instance_create_layer(x + lengthdir_x(64, image_angle), y + lengthdir_y(64, image_angle),"Instances", obj_muzzleflash);
		audio_play_sound(snd_shoot, 0, 0);
		
		
		cooldown = cooldownTimer;
	}
}
cooldown += -1;
/*
// Go through each key input
for ( var i = 0; i < array_length_1d(movement_inputs); i++){
    var this_key = movement_inputs[i];
    if keyboard_check(this_key) {
        var this_angle = i*90;
		
		x += lengthdir_x(1, this_angle);
		y += lengthdir_y(1, this_angle);
		//moving down
		if ( i == inputKeyElementID.s_key){
			var t1 = tilemap_get_at_pixel(tilemap,bbox_left, bbox_bottom) & tile_index_mask;
			var t2 = tilemap_get_at_pixel(tilemap,bbox_right, bbox_bottom) & tile_index_mask;	
			
			if( t1 != 0 && t2 != 0){
				y = (((bbox_bottom & ~63) - 1) - 1) - sprite_bbox_bottom;
			}
		}else{
			x += lengthdir_x(1, this_angle);
			y += lengthdir_y(1, this_angle);
		}
    }
}*/

/* super jank movement code that's meant to slip and slide, also matches a tileset mask before moving which is uber jank*/
var seconds_passed = delta_time/1000000;
var move_speed_this_frame = moveSpeed*seconds_passed;
//x += move_speed_this_frame; // Testing movement
if (global.debugPlayer && debugTimer[1] > global.debugStreamFrequency){
	debugTimer[1] = 0;
	show_debug_message("Time passed in seconds is " + string(seconds_passed));
}

var move_xinput = 0;
var move_yinput = 0;

// Go through each key input
for ( var i = 0; i < array_length_1d(movement_inputs); i++){
    var this_key = movement_inputs[i];
    if keyboard_check(this_key) {
        var this_angle = i*90;
		// Potential move inputs calculated from vectors
        move_xinput += lengthdir_x(1, this_angle);
        move_yinput += lengthdir_y(1, this_angle);
    }
}
 
var moving = ( point_distance(0,0,move_xinput,move_yinput) > 0 );

if moving  {
    var move_dir = point_direction(0,0,move_xinput,move_yinput);
	
	// Begin sweep if place not free 
	var spd = move_speed_this_frame;
	var dir = move_dir;
	 
	var xtarg = x+lengthdir_x(spd,dir);
	var ytarg = y+lengthdir_y(spd,dir);
	
	// Get tilemaps at pixel
	var t1 = tilemap_get_at_pixel(tilemap,bbox_left, bbox_bottom) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap,bbox_right, bbox_bottom) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap,bbox_left, bbox_top) & tile_index_mask;
	var t4 = tilemap_get_at_pixel(tilemap,bbox_right, bbox_bottom) & tile_index_mask;
	
	var tileMapAtPixel = (t1 != 0 || t2 != 0 || t2 != 0 || t4 != 0);
	
	// If can place
	if (place_free(xtarg,ytarg)) {
	    x = xtarg;
	    y = ytarg;
		
		// Check collision 
			
		
	}// If can't place
	else {
	    var sweep_interval = 10;
	    // Sweep every 10 degrees
	    for ( var angle = sweep_interval; angle <= 80; angle += sweep_interval) {
			
			// E.g. -10, 10, 20
	        for ( var multiplier = -1; multiplier <= 1; multiplier += 2) {      
	            var angle_to_check = dir+angle*multiplier;
				
				//  Check location with angle
	            xtarg = x+lengthdir_x(spd, angle_to_check);
	            ytarg = y+lengthdir_y(spd, angle_to_check);
				
				// Can we place now?
	            if (place_free(xtarg,ytarg)) {
	                x = xtarg;
	                y = ytarg;  
	                exit;       
	            }   
	        }
	    }
	}
}

// Reload
if (keyboard_check(ord("R")) && !isReloading && currentAnimation != playerAnimation.runreload) {
	if (debugTimer > global.debugEventFrequency){
		debugTimer = 0	
		show_debug_message("Player is reloading...");
	}
	
	isReloading = true;
	if (beginMoving){
		sprite_index = playerAnimation.runreload;
	}
}

if (debugTimer > global.debugEventFrequency){
		debugTimer[0] = 0;
		show_debug_message("Player is reloading...");
	}