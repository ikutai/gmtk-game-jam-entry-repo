/// @description state machine

#region //variables

hsp = 0; //horizontal speed at any given frame
vsp = 0; //vertical speed at any given frame

minspd = 0.25; //minimum horizontal movement speed
maxspd = 4; //maximum horizontal movement speed
ispd = 0.06; //initial basic movement speed on button press

jump = -7*image_yscale; //jump height

grv = 0.3; //gravity constant
acel = 0.2; //movement acceleration 

decel_g = 0.85; //decceleration on ground
decel_a = 0.95; //decceleration in air

on_ground = false; //checks if player is on the ground or not
on_wall = false; //checks if player is on a wall or not

small = true; //special mechanic state

#endregion

#region //idle state

idle_state = new state(); //establising the state

idle_state.start = function(){
	//preventing potential collision bugs(?)
	basic_collision(); //(see "PlayerFunctions" script)
	
	//for state testing and animation/sound
	check_size(); //(see "PlayerFunctions" script)
	image_index = 0;
	
	return;
}

idle_state.run = function(){	
	//runs the basic movement script
	basic_movement();
	
	if (hsp != 0) && (on_ground){ //if the player has horizontal speed and is on the ground
		change_state(move_state); //then they are moving on the ground
	}
	if (!on_ground){ //if the player is not on the ground
		change_state(in_air_state); //then they are in the air
	}
	
	return;
}

	//nothing to perform when the state ends

#endregion

#region //move state

move_state = new state(); //establishing the state

move_state.start = function(){
	//for state testing and animation/sound
	check_size(); //(see "PlayerFunctions" script)
	image_index = 1;
	
	return;	
}

move_state.run = function(){
	//runs the basic movement script
	basic_movement(); //(see "PlayerFunctions" script)
	
	if (!on_ground){ //if the player is not on the ground
		change_state(in_air_state);	//then they are in the air
	}
	if (hsp == 0) && (on_ground){ //if the player has no horizontal speed and is on the ground
		change_state(idle_state); //then they are idle
	}

	return;
}
	
	//nothing to perform when the state ends
	
#endregion

#region //in air state

in_air_state = new state(); //establishing the state

in_air_state.start = function(){
	//for state testing and animation/sound
	check_size(); //(see "PlayerFunctions" script)
	image_index = 2;
	
	return;	
}

in_air_state.run = function(){
	//runs the basic movement script
	basic_movement(); //(see "PlayerFunctions" script)
	
	if (hsp == 0) && (on_ground){ //if the player has no horizontal speed and is on the ground
		change_state(idle_state); //then they are idle
	}
	if (hsp != 0) && (on_ground){ //if the player has horizontal speed and is on the ground
		change_state(move_state); //then they are moving on the ground
	}
	
	return;
}

	//nothing to perform when the state ends
	
#endregion

init_state(idle_state); //determines which state the object starts in