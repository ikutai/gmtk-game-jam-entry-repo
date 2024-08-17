/// @description state updater
image_speed = 0; //for state testing

on_ground = place_meeting(x, y + 1, oWall) || place_meeting(x, y + 1, oBWall); //checks if the player is on the ground at any given frame
on_wall = place_meeting(x + sign(dcos(direction)), y, oWall) || place_meeting(x + sign(dcos(direction)), y, oBWall); //checks if the player is on a wall at any given frame
jump = -7*image_yscale;
get_input(); //checks for player input every frame (see "PlayerFunctions" script)
run_state(); //runs the state machine and checks for current state every frame (see "StateMachine" script)

show_debug_message(hsp)