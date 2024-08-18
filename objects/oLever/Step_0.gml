image_index = active
if place_meeting(x,y,oPlayer)
if keyboard_check_pressed((ord("Z")))
active = !active

switch active
{
	case true:
	destroyid.turned = !active
	case false:
	destroyid.turned = !active
}