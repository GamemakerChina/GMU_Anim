///@arg inst/obj
///@arg var_name
///@arg tween
///@arg ease
///@arg start
///@arg change
///@arg duration
///@arg delay*
///@arg extra1*
///@arg extra2*
var inst=argument[0];
var var_name=argument[1];
var tween=argument[2];
var ease=argument[3];
var start=argument[4];
var change=argument[5];
var duration=argument[6];
var delay=0;
var extra1=0;
var extra2=0;

if(argument_count==8){
	delay=argument[7];
}
if(argument_count==9){
	extra1=argument[8];
}
if(argument_count==10){
	extra2=argument[9];
}

var inst_result=noone;

if(instance_exists(inst)&&duration>=0&&(((tween>=0&&tween<=GMU_ANIM_BOUNCE)&&(ease>=GMU_ANIM_IN&&ease<=GMU_ANIM_IN_OUT))||tween==GMU_ANIM_LINEAR)&&duration>=0){
	var proc=0;
	var proc_result=0;
	var inst_find=noone;
	
	repeat(instance_number(inst)){
		inst_find=instance_find(inst,proc);
		if(instance_exists(inst_find)){
			if(variable_instance_exists(inst_find,var_name)){
				//寻找重复动画实例并销毁
				var proc_check=0;
				var inst_find_check=noone;
				
				repeat(instance_number(_gmu_anim)){
					inst_find_check=instance_find(_gmu_anim,proc_check);
					if(instance_exists(inst_find_check)){
						if(inst_find_check._inst==inst_find&&inst_find_check._var_name==var_name){
							instance_destroy(inst_find_check);
							proc_check-=1;
						}
					}
					proc_check+=1;
				}
				
				inst_result[proc_result]=instance_create_depth(0,0,0,_gmu_anim);
				inst_result[proc_result]._inst=inst_find;
				inst_result[proc_result]._var_name=var_name;
				inst_result[proc_result]._tween=tween;
				inst_result[proc_result]._ease=ease;
				inst_result[proc_result]._start=start;
				inst_result[proc_result]._change=change;
				inst_result[proc_result]._duration=duration;
				inst_result[proc_result]._delay=delay;
				inst_result[proc_result]._extra1=extra1;
				inst_result[proc_result]._extra2=extra2;
			
				proc_result+=1;
			}
		}
		proc+=1;
	}
}
return inst_result;