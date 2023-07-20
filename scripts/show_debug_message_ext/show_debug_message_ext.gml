function show_debug_message_ext(){
	var str = "";
	for (var i = 0; i < argument_count; i++) {
		str += string(argument[i]);	
	}
	show_debug_message(str);
}

#macro sd show_debug_message_ext