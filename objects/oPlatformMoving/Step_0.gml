/// @description functionality 
mask_index = sPlatformMoving;

//platform movement
hsp = dir * maxspd;
	
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

if (instance_exists(oPlayer)){ //if the player exists
	if (round(oPlayer.y + (oPlayer.sprite_height / 2)) > y) || (oPlayer.key_down){ //and if they player position plus half its height is greater than the y coordinate of the platform
		mask_index = -1; //then the mask is the default for the sprite
	}
	else{
		mask_index = sPlatformMoving;
		if (place_meeting(x, y - 1, oPlayer)){
			oPlayer.hsp_carry = hsp;
		}
	}
}