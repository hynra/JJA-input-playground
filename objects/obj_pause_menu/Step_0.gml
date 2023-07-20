// hover input
for(var i=0;i<array_length(input_verbs); i++){
	var input_verb = array_get(input_verbs, i);
	var xp = top_x + 420;
	var yp = top_y + i * 80;
	
	var w_ =  300;
	var h_ = 50;
	
	var MX_GUI = device_mouse_x_to_gui(0);
	var MY_GUI = device_mouse_y_to_gui(0);
		
	if(point_in_rectangle(MX_GUI, MY_GUI, xp, yp, xp + w_, yp + h_)){
		
		// avoid multiple checking
		if(input_verb.hover == false){
			input_verb.hover = true;
		
			// listen to binding
			var _iv = input_verb;
			input_binding_scan_start(function(_binding)
			{
			    //On success, set a binding and show positive feedback
				sd("new binding: ", _binding);
				sd(input_verb);
				// input_binding_set_safe(other.input_verb.name, _binding, player_id);
		   
			},
			undefined, player_id);
		}
		
	} else {
		if(input_verb.hover == true){
			input_verb.hover = false;
			input_binding_scan_abort(player_id);
		}
		
	}
}

