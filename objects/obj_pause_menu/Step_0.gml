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
			global.current_hover = i;
		
			// listen to binding
			input_binding_scan_start(function(_binding)
			{
				var current_input_verb = array_get(input_verbs, global.current_hover);
				
				// check coliisions
				var collisions = input_binding_test_collisions(current_input_verb.name, _binding, player_id);
				sd("collsions: ", collisions);
				// var vbs = input_binding_get_verbs()
				
				if(array_length(collisions) > 0){
					for(var j=0;j<array_length(collisions);j++){
						var coll = array_get(collisions, j)
						var verb = coll.verb;
						
						// loop verbs
						for(var k=0; k<array_length(input_verbs);k++){
							var target_input = array_get(input_verbs, k);
							if target_input.name == verb {
								sd("conflict with: ", target_input.name);
								input_binding_remove(target_input.name, player_id);
								target_input.next_binding = -1;
							}
						}
					}
				}
				
				input_binding_set(current_input_verb.name, _binding, player_id);
				
				current_input_verb.next_binding = _binding;
		   
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



var MX_GUI = device_mouse_x_to_gui(0);
var MY_GUI = device_mouse_y_to_gui(0);
var w_ =  200;
var h_ = 50;
var xp = top_x + 210;
var yp = top_y + 360;

if(point_in_rectangle(MX_GUI, MY_GUI, xp, yp, xp + w_, yp + h_)){
	hover_reset_button = true;
} else hover_reset_button = false;

if(hover_reset_button){
	if(input_check_pressed("shoot", player_id)){
		// rebind all to previous bind
		for(var i=0;i<array_length(input_verbs);i++){
			var iv = array_get(input_verbs, i);
			iv.next_binding = iv.previous_binding;
			input_binding_set(iv.name, iv.next_binding, player_id);
			
		}
	}
}
