// Orientation
direction = point_direction(x, y, mouse_x, mouse_y);
image_angle = direction;


// Player move animation
if (beginMoving){
	sprite_index = playerAnimation.walk;
	beginMoving = false;
}else{
	sprite_index = playerAnimation.idle;
}


// Player sprint check
if (playerSprinting){
//runSpeed = defaultSprintSpeed;
moveSpeed = moveSpeedDefault * moveSpeedSprintMult;
image_speed = 3;
}else{
//runSpeed = defaultRunSpeed;
moveSpeed = moveSpeedDefault;
image_speed = 1;
}

// Aiming and shooting
if (mouse_check_button(mb_left))
{
	if(cooldown <= 0)
	{
		//spawn bullet and fire
		//instance_create_layer(x+10, y, "Instances", obj_bullet);
		
		//motion_add(point_direction(x,y,mouse_x,mouse_y)+180,5);
		instance_create_layer(x + lengthdir_x(30, image_angle), y + lengthdir_y(30, image_angle),"Instances", obj_bullet);
		audio_play_sound(snd_shoot, 0, 0);
		
		
		cooldown = cooldownTimer;
	}
}
cooldown += -1;


var seconds_passed = delta_time/1000000;
var move_speed_this_frame = moveSpeed*seconds_passed;
//x += move_speed_this_frame; // Testing movement

var move_xinput = 0;
var move_yinput = 0;
 
for ( var i = 0; i < array_length_1d(movement_inputs); i++){
    var this_key = movement_inputs[i];
    if keyboard_check(this_key) {
        var this_angle = i*90;
        move_xinput += lengthdir_x(1, this_angle);
        move_yinput += lengthdir_y(1, this_angle);
    }
}
 
var moving = ( point_distance(0,0,move_xinput,move_yinput) > 0 );
if moving  {
    var move_dir = point_direction(0,0,move_xinput,move_yinput);
	
	//x += lengthdir_x(move_speed_this_frame, move_dir);
    //y += lengthdir_y(move_speed_this_frame, move_dir);
	
	// Begin sweep if place not free 
	var spd = move_speed_this_frame;
	var dir = move_dir;
	 
	var xtarg = x+lengthdir_x(spd,dir);
	var ytarg = y+lengthdir_y(spd,dir);
	
	// If can place
	if place_free(xtarg,ytarg) {
	    x = xtarg;
	    y = ytarg;
	}// If can't place
	else {
	    var sweep_interval = 10;
	    
	    for ( var angle = sweep_interval; angle <= 80; angle += sweep_interval) {
	        for ( var multiplier = -1; multiplier <= 1; multiplier += 2) {      
	            var angle_to_check = dir+angle*multiplier;
	            xtarg = x+lengthdir_x(spd, angle_to_check);
	            ytarg = y+lengthdir_y(spd, angle_to_check);     
	            if place_free(xtarg,ytarg) {
	                x = xtarg;
	                y = ytarg;  
	                exit;       
	            }   
	        }
	    }
	}
}



/* Might need this

// Fancy movement script I stole from the web
var seconds_passed = delta_time/1000000;
var move_speed_this_frame = move_speed*seconds_passed;
//x += move_speed_this_frame;

var move_xinput = 0;
var move_yinput = 0;
 
for ( var i = 0; i < array_length_1d(movement_inputs); i++){
    var this_key = movement_inputs[i];
    if keyboard_check(this_key) {
        var this_angle = i*90;
        move_xinput += lengthdir_x(1, this_angle);
        move_yinput += lengthdir_y(1, this_angle);
    }
}
 
var moving = ( point_distance(0,0,move_xinput,move_yinput) > 0 );
if moving  {
    var move_dir = point_direction(0,0,move_xinput,move_yinput);
    x += lengthdir_x(move_speed_this_frame, move_dir);
    y += lengthdir_y(move_speed_this_frame, move_dir);
}*/