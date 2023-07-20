
draw_gui = function(){

	DSC(c_black); DSA(.9);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

	DSC(c_white);
	draw_text(display_get_gui_width()/2, 82, "SETUP INPUT");
	
	// draw input name
	for(var i=0;i<array_length(input_verbs);i++){
		
		var input_verb = array_get(input_verbs, i);
		
		var xp = top_x;
		var yp = top_y + i * 80;
	
		var w_ =  200;
		var h_ = 50;
		
		draw_rectangle(xp, yp, xp + w_, yp + h_, true);
		draw_text(xp + 65, yp + 12, input_verb.name);
		
	}
	
	// draw current binding
	for(var i=0;i<array_length(input_verbs); i++){
		var input_verb = array_get(input_verbs, i);
		var xp = top_x + 420;
		var yp = top_y + i * 80;
	
		var w_ =  300;
		var h_ = 50;
		
		draw_rectangle(xp, yp, xp + w_, yp + h_, true);
		// draw_text(xp + 145, yp + 22, string(input_verb.current_input));
		
		if(input_verb.hover){
			draw_text(xp + 145, yp + 22, "....");
			DSC(c_gray); DSA(.3);
			draw_rectangle(xp, yp, xp + w_, yp + h_, false);
			DSA(1)
		} else {
			var binding_ = input_binding_get(input_verb.name);
			var name_ = input_binding_get_name(binding_);
			draw_text(xp + 145, yp + 22, name_);
		}
		
	}
	

}


draw_gui();

