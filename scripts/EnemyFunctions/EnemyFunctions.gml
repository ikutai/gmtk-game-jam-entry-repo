function enemy_collision(){
	//horizontal collision
	if (place_meeting(x + hsp, y, oWall)) 
	{
		while (!place_meeting(x + sign(hsp), y, oWall))
		{
			x += sign(hsp);	
		}
		dir *= -1;
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
	y += vsp; 

	//enemy collision
	if (place_meeting(x, y, oPlayer))
	{
		if (oPlayer.sprite_index == sPlaceholderTall){
			instance_destroy();	//exchange this line for another function
		}
		else if (oPlayer.y < y - (sprite_height / 2)) //y - 16
		{
			with (oPlayer) vsp -= jump;	
			instance_destroy(); //exchange this line for another function
		}
		else
		{
			game_restart();
		}
	}
}

function enemy_movement(){
	hsp = dir * maxspd;
	vsp += grv;
	image_xscale = sign(hsp);
}

