var _new_source = input_source_detect_new();
if (_new_source != undefined)
{
    var _i = 0;
    repeat(INPUT_MAX_PLAYERS)
    {
        if (!input_player_connected(_i))
        {
			show_debug_message("found new input! "+string(_new_source));
            input_source_set(_new_source, _i, true);
            input_verb_consume(all, _i);
			instance_create_layer(display_get_width()/2, display_get_height()/2, "Instances", obj_player);
			//var inpt = input_source_get_array(_i);
			//show_debug_message("inpt: "+string(inpt));
            break;
        }
        
        ++_i;
    }
}



