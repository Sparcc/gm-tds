
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