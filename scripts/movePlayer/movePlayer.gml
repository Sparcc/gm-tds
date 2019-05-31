var moveSpeed = argument0;
var movement_inputs = argument1;
var playerMoving = argument2;

var seconds_passed = delta_time/1000000;
var move_speed_this_frame = moveSpeed*seconds_passed;
//x += move_speed_this_frame; // Testing movement

var move_xinput = 0;
var move_yinput = 0;
var keysPressed = 0;
// Go through each key input
for ( var i = 0; i < array_length_1d(movement_inputs); i++){
    var this_key = movement_inputs[i];
    if keyboard_check(this_key) {
		// Detect if any keys pressed then player is moving
		keysPressed ++;
		playerMoving = true;
		
		// Potential move inputs calculated from vectors
        var this_angle = i*90;
        move_xinput += lengthdir_x(1, this_angle);
        move_yinput += lengthdir_y(1, this_angle);
	}
}
// If no keys were pressed then player is not moving
if (keysPressed == 0){
	playerMoving = false;
}
keysPressed = 0; // Reinitialise key check


 
var moving = ( point_distance(0,0,move_xinput,move_yinput) > 0 );

var x_vector = 0;
var y_vector = 0;


if moving  {
    var move_dir = point_direction(0,0,move_xinput,move_yinput);
	
	// Begin sweep if place not free 
	var spd = move_speed_this_frame;
	var dir = move_dir;
	 
	x_vector = lengthdir_x(spd,dir);
	y_vector = lengthdir_y(spd,dir);
 
	 
	var xtarg = x+x_vector;
	var ytarg = y+y_vector;
	
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
playerVariables = ds_map_create();
ds_map_add(playerVariables,"playerMovingMap",playerMoving);
ds_map_add(playerVariables,"playerXVectorMap",x_vector);
ds_map_add(playerVariables,"playerYVectorMap",y_vector);
<<<<<<< HEAD
=======
ds_map_add(playerVariables,"hi","hello");
show_debug_message("ds map from move script = "+string(ds_map_read(playerVariables, "hi")));
>>>>>>> parent of 217da4a... fixed broken move animation
return playerVariables;