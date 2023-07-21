#macro DSC draw_set_color
#macro DSH draw_set_halign
#macro DSV draw_set_valign
#macro DSF draw_set_font
#macro DSA draw_set_alpha

depth = obj_input_manager.depth - 1

global.current_hover = -1;

Init = function(){
	
	is_collision = false
	hover_reset_button = false;
	// player_id = 0;
	
	// input_verbs
	// player_input
	
	// base pos
	top_x = 295;
	top_y = 307;
	
	// get player input, player 0 for now
	input_verbs = array_get(global.players, player_id).input_verbs;
	
	// add hover for GUI
	for(var i=0;i<array_length(input_verbs); i++){
		var input_verb = array_get(input_verbs, i);
		input_verb.hover = false;
	}
	
}


