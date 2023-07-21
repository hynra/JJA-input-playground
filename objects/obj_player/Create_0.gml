array_push(global.players, self);

// player_id = 0;

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

input_verbs = [

	{
		name: "up",
		previous_binding: -1,
		next_binding: -1,
	},
	{
		name: "down",
		previous_binding: -1,
		next_binding: -1,
	},
	{
		name: "left",
		previous_binding: -1,
		next_binding: -1,
	},
	{
		name: "right",
		previous_binding: -1,
		next_binding: -1,
	}

]


for(var i=0;i<array_length(input_verbs); i++){
	var input_verb = array_get(input_verbs, i);
	var current_input_ = input_binding_get(input_verb.name, player_id);
	sd("Input name: ", input_verb.name, " - current binding: ", current_input_);
	input_verb.previous_binding = current_input_;
	input_verb.next_binding = current_input_;
	
}

//Remove the mouse cursor since it'll get in the way whilst aiming
// window_set_cursor(cr_none);