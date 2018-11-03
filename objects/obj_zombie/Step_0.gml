
if(instance_exists(obj_player))
{
	direction = point_direction(x, y, obj_player.x, obj_player.y);

	speed = objectSpeed;
}

image_angle = direction;

if(hp <= 0)
{
	instance_destroy();
}

/*
var seconds_passed = delta_time/1000000;
var move_speed_this_frame = moveSpeed*seconds_passed;
//x += move_speed_this_frame; // Testing movement

show_debug_message("Time passed in seconds is " + string(seconds_passed));

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
*/