show_debug_message("hp is " + string(hp));
var collidedObj = other;
show_debug_message("Other bullets id = "+string(collidedObj.id));
show_debug_message("Other bullets var1 = "+string(collidedObj.testVar1));
show_debug_message("Other bullets animation = "+string(collidedObj.currentAnimation));
//show_debug_message("Other bullets var2 = "+string(collidedObj.testVar2));
//if(collidedObj.currentAnimation) == string(spr_bullet)){
	//hp -= 1;

	if(hp <= 0){
		instance_create_layer(x, y, "Floor", obj_blood);
		instance_destroy();
	}
//}