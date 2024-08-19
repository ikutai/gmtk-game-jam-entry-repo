image_index = active
if place_meeting(x,y,[oBox,oPlayer]) or place_meeting(x,y-1,[oBox,oPlayer])
active = true
else
active = false

switch active
{
	case true:
	destroyid.turned = !active
	case false:
	destroyid.turned = !active
}