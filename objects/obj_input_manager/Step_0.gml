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
            break;
        }
        
        ++_i;
    }
}


var _status = input_players_get_status();
if (is_struct(_status))
{
    //We've seen at least one disconnection - destroy an existing player object
    if (array_length(_status.new_disconnections) > 0)
    {
        var _i = 0;
        repeat(array_length(_status.new_disconnections))
        {
            var _new_player = _status.new_disconnections[_i];
            with(obj_player)
            {
                if (player_id == _new_player) instance_destroy();
				// update global players
				var total_players = array_length(global.players);
				for(var _j = 0; _j<total_players; _j++){
					var _player = array_get(global.players, _j);
					if(_player.player_id == player_id){
						array_delete(global.players, _j, _j);
					}
				}
            }
            
            ++_i;
        }
    }
    
    //We've seen at least one connection - create a new player object
    if (array_length(_status.new_connections) > 0)
    {
        var _i = 0;
        repeat(array_length(_status.new_connections))
        {
            var _new_player = _status.new_connections[_i];
            
            //Make sure we don't accidentally spawn one than one object per player
            var _existing = false;
            with(obj_player)
            {
                if (player_id == _new_player)
                {
                    _existing = true;
                    break;
                }
            }
            
            if (!_existing)
            {
               //Spawn a player at the necessary spawn point
              
                
            }
            
            ++_i;
        }
    }
}


