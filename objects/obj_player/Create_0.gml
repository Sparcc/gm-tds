enum playerAnimation {
   idle = spr_player_idle,
   walk = spr_player_walk
   }
beginMoving = true;
defaultRunSpeed = 5;
defaultSprintSpeed = 10;
runSpeed = defaultRunSpeed;
playerSprinting = false;
cooldown = 0;
cooldownTimer = 4
sprite_index = playerAnimation.walk
image_speed = 1;



movement_inputs[0] = ord("D");
movement_inputs[1] = ord("W");
movement_inputs[2] = ord("A");
movement_inputs[3] = ord("S");