if(instance_exists(_inst)){
	if(_delay<=0){
		_time+=1;
		if(_time<_duration && _change!=0){
			event_user(0);
		}else{
			variable_instance_set(_inst,_var_name,_start+_change);
			instance_destroy();
		}
	}else{
		_delay-=1;
	}
}else{
	instance_destroy();
}