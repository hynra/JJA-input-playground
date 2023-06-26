array_push(global.players, self);

player_id = 0;

for(var i = 0; i<array_length(global.players); i++){
	var _plyr = array_get(global.players, i);
	if _plyr.id == self.id {
		player_id = i;		
		show_debug_message("player id: "+string(player_id));
	}
}


x_speed = 0;
y_speed = 0;

aim_direction = 0;

xy_acceleration = 0.9;

xy_damping = 0.90;

shoot_timer = 0;

//Remove the mouse cursor since it'll get in the way whilst aiming
window_set_cursor(cr_none);