var seconds_passed = delta_time/1000000;

if(instance_exists(obj_player))
{
	direction = point_direction(x, y, obj_player.x, obj_player.y);

	speed = spd;
}

if(direction){
	if(global.debugDoggles){
		show_debug_message("Doggle's direction is " + string(direction));
	}
}

//image_angle = direction;

if(hp <= 0)
{
	//with (obj_score) thescore = thescore + 5;
	//audio_sound_pitch(snd_death,random_range(0.8,1.2));
	//audio_play_sound(snd_death,0,0);
	instance_destroy();
}
