enum zombieAnimation {
   idle = spr_zombie_idle,
   walk = spr_zombie_walk
   }
   
beginMoving = true;
zombieSprinting = true;
cooldown = 0;
cooldownTimer = 4
objectSpeedDefault = 1;
objectSpeed = objectSpeedDefault;
hp = 25;

sprite_index = zombieAnimation.idle //Default animation
image_speed = 1;

moveSpeedDefault = 150;
moveSpeed = moveSpeedDefault;
moveSpeedSprintMult = 1.8;
