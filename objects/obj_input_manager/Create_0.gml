/// @description Insert description here
// You can write your code in this editor
input_source_mode_set(INPUT_SOURCE_MODE.FIXED);

// manually assign a source to a player
var kmb_available = input_source_is_available(INPUT_KEYBOARD);
if(kmb_available){
	show_debug_message("kmb available, assign to player 0");
	input_source_set(INPUT_KEYBOARD, 0);
	input_verb_consume(all, 0);
	instance_create_layer(display_get_width()/2, display_get_height()/2, "Instances", obj_player);
}


// keyboard and mouse