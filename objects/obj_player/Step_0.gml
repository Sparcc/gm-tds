// Orientation
direction = point_direction(x, y, mouse_x, mouse_y);
image_angle = direction;

if (beginMoving){
	sprite_index = playerAnimation.walk;
	beginMoving = false;
}else{
	sprite_index = playerAnimation.idle;
}

if (playerSprinting){
runSpeed = defaultSprintSpeed;	
image_speed = 10;
}else{
runSpeed = defaultRunSpeed;	
image_speed = 1;
}


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
}


// Aiming
if (mouse_check_button(mb_left))
{
	if(cooldown <= 0)
	{
		instance_create_layer(x, y, "Instances", obj_bullet);
	
		audio_play_sound(snd_shoot, 0, 0);
	
		cooldown = cooldownTimer;
	}
}

cooldown += -1;
