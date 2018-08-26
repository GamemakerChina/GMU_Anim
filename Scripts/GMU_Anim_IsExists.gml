///@arg target
///@arg var_name*
var inst=argument[0];
var var_name="";
if(argument_count>=2){
	var_name=argument[1];
}

var result=false;

if(instance_exists(inst)){
	if(inst.object_index==_gmu_anim){
		if(instance_exists(inst._inst)){
			if(var_name==""||inst._var_name==var_name){
				result=true;
			}
		}
	}else{
		var proc=0;
		var inst_find=noone;
		
		repeat(instance_number(_gmu_anim)){
			inst_find=instance_find(_gmu_anim,proc);
			if(instance_exists(inst_find)){
				if(instance_exists(inst_find._inst)){
					if(inst_find._inst==inst||inst_find._inst.object_index=inst){
						if(var_name==""||inst_find._var_name==var_name){
							result=true;
							break;
						}
					}
				}
			}
			proc+=1;
		}
	}
}

return result;