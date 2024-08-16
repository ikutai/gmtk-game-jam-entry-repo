/// @description update camera
//update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//update object position
x += (xTo - x) / 5; 
y += (yTo - y) / 5;

//keep camera center inside room
x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);
