// Orientation
direction = point_direction(x, y, mouse_x, mouse_y);
image_angle = direction;

// Aiming and shooting
if (mouse_check_button(mb_right)){
	global.mainCameraFollowing = obj_crosshair;
}else{
	global.mainCameraFollowing = obj_player;
}

var bulletInstance = 0;
var flashInstance = 0;

if (mouse_check_button(mb_left) && !isReloading && playerAmmo >0)
{
	playerRecoilTimer += (delta_time/1000000);//tick up the recoil timer
	//show_debug_message("playerRecoilTimer="+string(playerRecoilTimer));
	if(cooldown <= 0)
	{
		// Set initial angle
		var angleTarget = image_angle;
		// Handle over recoil limit - Set to max
		if (playerRecoilSpreadCone >= playerRecoilLimit){
			show_debug_message("playerRecoilLimit reached");
			playerRecoilSpreadCone = playerRecoilLimit;
		}else{
			// Calculate recoil and set angle
			playerRecoilSpreadCone += playerRecoilTimer*playerRecoilIntensity; // increment recoil spread cone
			show_debug_message("playerRecoilSpreadCone="+string(playerRecoilSpreadCone));
		}
		// Add recoil as + or - recoild to add, with range starting from 0 to edge of spread cone
		var randVal = random_range(0,100);
		if (randVal >50){
			angleTarget += random_range(0,playerRecoilSpreadCone);
		}else{
			angleTarget -= random_range(0,playerRecoilSpreadCone);
		}
		image_angle = angleTarget;
		
		
		
		
		/*
		var projectile = instance_create(x, y, obj_bullet); // Create a bullet
		var launchSpeed = 32;
		
		projectile.direction = image_angle; // Set movement direction to the launcher's angle
		projectile.image_angle = image_angle; // Set projectile facing to the to the launcher's angle
		projectile.speed = launchSpeed; // Set the speed of the projectile
		*/
		
		var projectile = instance_create_layer(x, y, "Instances",obj_bullet); // Create a bullet
		var launchSpeed = 32;
		//projectile.image_angle = angleTarget;
		
		projectile.direction = image_angle; // Set movement direction to the launcher's angle
		projectile.image_angle = image_angle; // Set projectile facing to the to the launcher's angle
		projectile.speed = launchSpeed; // Set the speed of the projectile
		
		//spawn bullet and fire
		//bulletInstance = instance_create_layer(x + lengthdir_x(30, image_angle), y + lengthdir_y(30, image_angle),"Instances", obj_bullet);
		//var bulletInstX = bulletInstance.x;
		//var bulletInstY = bulletInstance.y;
		
		flashInstance = instance_create_layer(x + lengthdir_x(64, image_angle), y + lengthdir_y(64, image_angle),"Instances", obj_muzzleflash);
		flashInstance.direction = image_angle; // Set movement direction to the launcher's angle
		flashInstance.image_angle = image_angle; // Set projectile facing to the to the launcher's angle

		//var flashInstX = flashInstance.x;
		//var flashInstY = flashInstance.y;
		
		audio_play_sound(snd_shoot, 0, 0);	
		cooldown = cooldownTimer;
		playerAmmo --;
	}
}else{
	//tick down the recoil timer	
	if( playerRecoilTimer -((delta_time/1000000)*playerRecoilCooldownIntensity)<playerRecoilInit){
		playerRecoilTimer = playerRecoilInit;
	}else{
		playerRecoilTimer -=((delta_time/1000000)*playerRecoilCooldownIntensity);
	}
	playerRecoilSpreadCone = playerRecoilTimer;
}
cooldown += -1;

for (var i = 0; i < array_length_1d(debugTimer); i++){
	debugTimer[i] += (delta_time/1000000);
}

// Player move animation
// Only change animation if not reloading and animation not set
if (!isReloading && playerMoving){
	//show_debug_message("Player is walking");
	currentAnimation = playerAnimation.walk;
	sprite_index = currentAnimation;
}else if (!isReloading && !playerMoving){
	//show_debug_message("Player is idle");
	currentAnimation = playerAnimation.idle;
	sprite_index = currentAnimation;
}

//Reloading
if (keyboard_check(ord("R")) && !isReloading){
	isReloading = true;
	//show_debug_message("Player is reloading");
	playerAmmo = playerAmmoReloadSize;
	// Running reload animation start (will run this animation all the time)
	if (currentAnimation != playerAnimation.runreload){
		//show_debug_message("Run animation is starting");
		currentAnimation = playerAnimation.runreload;
		sprite_index = currentAnimation;
	}
}


// Player sprint check
if (playerSprinting){
//runSpeed = defaultSprintSpeed;
moveSpeed = moveSpeedDefault * moveSpeedSprintMult;
//show_debug_message("Player is sprinting");
image_speed = 2;
}else{
//runSpeed = defaultRunSpeed;
moveSpeed = moveSpeedDefault;
image_speed = 1;
}

/*
---
//var moveSpeed = argument0;
//var movement_inputs = argument1;
//var playerMoving = argument2;
//return ds_map: moveSpeed,movement_inputs,playerMoving
---
*/

//playerVariables = ds_map_create();
//ds_map_copy(playerVariables, ds_map_copy
playerVariables = script_execute(movePlayer,moveSpeed,movement_inputs,playerMoving);
//show_debug_message("ds map from move script = "+string(ds_map_read(playerVariables, "hi")));
//playerMoving = ds_map_read(playerVariables, "playerMovingMap");
//show_debug_message("playerMoving="+string(playerMoving));
//update position of spawn instances according to player movement
//(flashInstance).x += ds_map_read(playerVariables, "playerXVectorMap");
//(flashInstance).y += ds_map_read(playerVariables, "playerYVectorMap");