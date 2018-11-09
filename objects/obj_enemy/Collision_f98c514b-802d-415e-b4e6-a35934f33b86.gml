
show_debug_message("hp is " + string(hp));

//if(other.currentAnimation == spr_bullet)
//{
	hp -= 1;

	if(hp <= 0)
	{
		instance_create_layer(x, y, "Floor", obj_blood);
		instance_destroy();
	}
//}