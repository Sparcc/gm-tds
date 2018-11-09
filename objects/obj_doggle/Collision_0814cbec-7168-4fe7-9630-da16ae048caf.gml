hp += -1;

if(hp <= 0)
{
	instance_create_layer(x, y, "Floor", obj_blood);
	instance_destroy();
}