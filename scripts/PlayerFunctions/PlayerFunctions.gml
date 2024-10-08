function get_input(){ //uses WASD control scheme only for testing
	key_left = keyboard_check(ord("A")); 
	key_right = keyboard_check(ord("D")); 
	key_jump = keyboard_check_pressed(ord("W"));
	key_change = keyboard_check_pressed(vk_space); //changes the players size
}

function basic_collision(){ //the basic collision function
	//horizontal collision
	if (place_meeting(x + hsp, y, oWall)) 
	{
		while (!place_meeting(x + sign(hsp), y, oWall))
		{
			x += sign(hsp);	
		}
		hsp = 0;
	}
	
	if (place_meeting(x + hsp, y, oBWall)) 
	{
		while (!place_meeting(x + sign(hsp), y, oBWall))
		{
			x += sign(hsp);	
		}
		if (abs(hsp) >= 2.5  && !small)
		{
			var _oBWall = instance_place(x + hsp, y, oBWall);
			instance_destroy(_oBWall)
			hsp = (hsp/2);
		}
		else
		{
			hsp = 0;
		}
	}
	
	x += hsp; 
	
	//vertical collision
	if (place_meeting(x, y + vsp, oWall)) 
	{
		while (!place_meeting(x, y + sign(vsp), oWall))
		{
			y += sign(vsp);	
		}
		vsp = 0;
	}
	
	if (place_meeting(x, y + vsp, oBWall) && !small) 
	{
		var _oBWall = instance_place(x, y + vsp, oBWall);
		vsp = 0;
		instance_destroy(_oBWall);
	}
	else if (place_meeting(x, y + vsp, oBWall))
	{
			while (!place_meeting(x, y + sign(vsp), oBWall))
		{
			y += sign(vsp);	
		}
		vsp = 0;	
	}
	
	
	y += vsp; 
	
		//powerup collision
	if (place_meeting(x, y, oPowerupSmall)){
		small = true;
		tall = false;
	}
	if (place_meeting(x, y, oPowerupTall)){
		tall = true;
		small = false;
	}
	if (place_meeting(x, y, oPowerupReset)){
		small = false;
		tall = false;
	}
	
}		

function basic_movement(){ //the basic movement function
	//player direction
	if (hsp != 0){
		image_xscale = sign(hsp);
		if (hsp > 0){
			direction = 0;	
		}
		if (hsp < 0){
			direction = 180;
		}
	}
	
	//player acceleration
	var _move = key_right - key_left; //if both keys are pressed, move = 0 (no movement)
	hsp += (sign(_move) * ispd) + (_move * acel);
	
	//player minimum speed
	if (abs(hsp) <= minspd){
		hsp = 0;
	}
	
	//player maximum speed
	if (abs(hsp) >= maxspd){
		hsp = maxspd * sign(hsp);
	}
	
	//player decceleration
	if (hsp != 0) && (_move == 0){
		if (on_ground){
			hsp *= decel_g;
		}
		if (!on_ground){
			hsp *= decel_a;	
		}
	}

	//player gravity
	vsp += grv;	
	
	//player jump
	if (on_ground) && (key_jump)
	{
		vsp = jump;	
	}	
	
	//player collision
	basic_collision();
}

function check_size(){ //checks the players size and switches sprites accordingly
	if (small == true){
		sprite_index = 	sPlaceholderSmall;
	}
	if (tall == true){
		sprite_index = sPlaceholderTall;	
	}
	if (!small) && (!tall){
		sprite_index = sPlaceholder
	}	
	//this function needs expanded functionality
}