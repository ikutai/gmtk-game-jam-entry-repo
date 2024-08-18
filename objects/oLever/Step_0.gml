image_index = active
if place_meeting(x,y,oPlayer)
if keyboard_check_pressed((ord("Z")))
active = !active

switch active
{
case true:
instance_deactivate_all(true)
case false:
instance_activate_all()
}

