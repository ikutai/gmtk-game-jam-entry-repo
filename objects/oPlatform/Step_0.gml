/// @description functionality
if (instance_exists(oPlayer)){ //if the player exists
	if (round(oPlayer.y + (oPlayer.sprite_height / 2)) > y) || (oPlayer.key_down){ //and if they player position plus half its height is greater than the y coordinate of the platform
		mask_index = -1; //then the mask is the default for the sprite
	}
	else{
		mask_index = sPlatform; 	
	}
}