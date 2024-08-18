if must_be_small == false
{
	if place_meeting(x,y,oPlayer)
		if keyboard_check_pressed(ord("W"))
			room_goto(intended_room)
}
else if !oPlayer.tall && !must_be_smaller
{
	if place_meeting(x,y,oPlayer)
		if keyboard_check_pressed(ord("W"))
			room_goto(intended_room)
}
else if must_be_smaller && oPlayer.small
{
	if place_meeting(x,y,oPlayer)
		if keyboard_check_pressed(ord("W"))
			room_goto(intended_room)
}
else
{	
}