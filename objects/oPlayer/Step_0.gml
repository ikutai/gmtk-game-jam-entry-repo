/// @description state updater
image_speed = 0; //for state testing

on_ground = place_meeting(x, y + 1, oWall) || place_meeting(x, y + 1, oBWall) || place_meeting(x, y + 1, oBox); //checks if the player is on the ground at any given frame
on_wall = place_meeting(x + sign(dcos(direction)), y, oWall); //checks if the player is on a wall at any given frame

get_input(); //checks for player input every frame (see "PlayerFunctions" script)
run_state(); //runs the state machine and checks for current state every frame (see "StateMachine" script)

switch sprite_index
{
	case sPlaceholder:
	if (!instance_exists(oPhysicPlayerNormal))
	instance_create_depth(x,y,depth,oPhysicPlayerNormal)
	case sPlaceholderSmall:
	if (!instance_exists(oPhysicPlayerSmall))
	instance_create_depth(x,y,depth,oPhysicPlayerSmall)
	case sPlaceholderTall:
	if (!instance_exists(oPhysicPlayerTall))
	instance_create_depth(x,y,depth,oPhysicPlayerTall)
}