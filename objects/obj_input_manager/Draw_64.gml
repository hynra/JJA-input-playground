/// @description Insert description here
// You can write your code in this editor
var _str = "";

var _i = 0;
repeat(INPUT_MAX_PLAYERS) {
	if (input_player_connected(_i)){
		var input_source = input_source_get_array(_i);
		
		_str += "Player "+string(_i) + " using "+string(input_source)+"\n";
	}
	 ++_i;
}

if(_str == ""){
	_str = "Press any key in keyboard or any button in gamepad";
}

draw_text(0, 0, _str);




