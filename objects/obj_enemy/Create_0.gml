enum bootyAnimation {
   idle = spr_booty_bounce,
   }
   
beginMoving = true;
zombieSprinting = true;
cooldown = 0;
cooldownTimer = 4
objectSpeedDefault = 1;
objectSpeed = objectSpeedDefault;
hp = 25;

sprite_index = bootyAnimation.idle //Default animation
image_speed = 1;

moveSpeedDefault = 150;
moveSpeed = moveSpeedDefault;
moveSpeedSprintMult = 1.8;
