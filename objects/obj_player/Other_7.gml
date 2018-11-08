if (isReloading == true && currentAnimation == playerAnimation.runreload){
	currentAnimation = playerAnimation.walk;
	sprite_index = currentAnimation;
	isReloading = false;
	show_debug_message("Stopping animation");
}