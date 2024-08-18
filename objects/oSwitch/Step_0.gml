image_index = active
if place_meeting(x,y,[oBox,oPlayer])
active = true
else
active = false

switch active
{
case true:
instance_deactivate_object(destroyid)
case false:
instance_activate_object(destroyid)
}