var r=0;
var t=_time;
var b=_start;
var c=_change;
var d=_duration;

switch(_tween){
	case GMU_ANIM_LINEAR:
		r=(t/d)*c+b;
		break;
		
	case GMU_ANIM_SINE:
		switch(_ease){
			case GMU_ANIM_IN:
				r=-c*cos(t/d*(pi/2))+c+b;
				break;
			case GMU_ANIM_OUT:
				r=c*sin(t/d*(pi/2))+b;
				break;
			case GMU_ANIM_IN_OUT:
				r=-c/2*(cos(pi*t/d)-1)+b;
				break;
		}
		break;
		
	case GMU_ANIM_QUAD:
		switch(_ease){
			case GMU_ANIM_IN:
				t/=d;
				r=c*t*t+b;
				break;
			case GMU_ANIM_OUT:
				t/=d;
				r=-c*t*(t-2)+b;
				break;
			case GMU_ANIM_IN_OUT:
				t/=d/2;
				if(t<1){
					r=c/2*t*t+b;
				}else{
					r=-c/2*((--t)*(t-2)-1)+b;
				}
				break;
		}
		break;
		
	case GMU_ANIM_CUBIC:
		switch(_ease){
			case GMU_ANIM_IN:
				t/=d;
				r=c*t*t*t+b;
				break;
			case GMU_ANIM_OUT:
				t=t/d-1
				r=c*(t*t*t+1)+b;
				break;
			case GMU_ANIM_IN_OUT:
				t/=d/2
				if(t<1){
					r=c/2*t*t*t+b;
				}else{
					t-=2;
					r=c/2*(t*t*t+2)+b;
				}
				break;
		}
		break;
		
	case GMU_ANIM_QUART:
		switch(_ease){
			case GMU_ANIM_IN:
				t/=d;
				r=c*t*t*t*t+b;
				break;
			case GMU_ANIM_OUT:
				t=t/d-1;
				r=-c*(t*t*t*t-1)+b;
				break;
			case GMU_ANIM_IN_OUT:
				t/=d/2
				if(t<1){
					r=c/2*t*t*t*t+b;
				}else{
					t-=2;
					r=-c/2*(t*t*t*t-2)+b;
				}
				break;
		}
		break;
		
	case GMU_ANIM_QUINT:
		switch(_ease){
			case GMU_ANIM_IN:
				t/=d;
				r=c*t*t*t*t*t + b;
				break;
			case GMU_ANIM_OUT:
				t=t/d-1;
				r=c*(t*t*t*t*t+1)+b;
				break;
			case GMU_ANIM_IN_OUT:
				t/=d/2
				if(t<1){
					r=c/2*t*t*t*t*t+b;
				}else{
					t-=2;
					r=c/2*(t*t*t*t*t+2)+b;
				}
				break;
		}
		break;
		
	case GMU_ANIM_EXPO:
		switch(_ease){
			case GMU_ANIM_IN:
				r=(t==0)?b : c*power(2,10*(t/d-1))+b;
				break;
			case GMU_ANIM_OUT:
				r=(t==d)?b+c : c * (-power(2,-10*t/d)+1)+b;
				break;
			case GMU_ANIM_IN_OUT:
				if (t==0){
					r=b;
				}
			   if(t==d){
					r=b+c;
				}
				t/=d/2;
			  if (t<1){
					r=c/2*power(2,10*(t-1))+b;
				}else{
					r=c/2*(-power(2,-10*--t)+2)+b;
				}
				break;
		}
		break;
		
	case GMU_ANIM_CIRC:
		switch(_ease){
			case GMU_ANIM_IN:
				t/=d;
				r=-c*(sqrt(1-t*t)-1)+b;
				break;
			case GMU_ANIM_OUT:
				t=t/d-1;
				r=c*sqrt(1-t*t)+b;
				break;
			case GMU_ANIM_IN_OUT:
				t/=d/2;
				if(t<1){
					r=-c/2*(sqrt(1-t*t)-1)+b;
				}else{
					t-=2;
					r=c/2*(sqrt(1-t*t)+1)+b;
				}
				break;
		}
		break;
		
	case GMU_ANIM_BACK:
		if(_extra1>0){
			var s=_extra1;
		}else{
			var s=1.70158;
		}
		switch(_ease){
			case GMU_ANIM_IN:
				t/=d;
				r=c*t*t*((s+1)*t-s)+b;
				break;
			case GMU_ANIM_OUT:
				t=t/d-1;
				r=c*(t*t*((s+1)*t+s)+1)+b;
				break;
			case GMU_ANIM_IN_OUT:
				t/=d/2;
				s*=1.525;
				if(t<1){
					r=c/2*(t*t*((s+1)*t-s))+b;
				}else{
					t-=2;
					r=c/2*(t*t*((s+1)*t+s)+2)+b;
				}
				break;
		}
		break;
		
	case GMU_ANIM_ELASTIC:
		var a=_extra1;
		var p=_extra2;
		switch(_ease){
			case GMU_ANIM_IN:
				if(t==0){
					r=b;
					break;
				}
				t/=d;
				if(t==1){
					r=b+c;
					break;
				}
				if(!p){
					p=d*0.3;
				}
				if(!a||a<abs(c)){
					a=c;
					var s=p/4;
				}else{
					var s=p/(2*pi)*arcsin(c/a);
				}
				t-=1;
				r=-(a*power(2,10*t)* sin((t*d-s)*(2*pi)/p))+b;
				break;
			case GMU_ANIM_OUT:
				if(t==0){
					r=b;
					break;
				}
				t/=d;
				if(t==1){
					r=b+c;
					break;
				}
				if(!p){
					p=d*0.3;
				}
				if(!a||a<abs(c)){
					a=c;
					var s=p/4;
				}else{
					var s=p/(2*pi)*arcsin(c/a);
				}
				r=a*power(2,-10*t)*sin((t*d-s)*(2*pi)/p)+c+b;
				break;
			case GMU_ANIM_IN_OUT:
				if(t==0){
					r=b;
					break;
				}
				t/=d/2;
				if(t==2){
					r=b+c;
					break;
				}
				if(!p){
					p=d*(0.3*1.5);
				}
				if(!a||a<abs(c)){
					a=c;
					var s=p/4;
				}else{
					var s=p/(2*pi)*arcsin(c/a);
				}
				t-=1;
				if(t<1){
					r=-0.5*(a*power(2,10*t)*sin((t*d-s)*(2*pi)/p))+b;
				}else{
					r=a*power(2,-10*t)*sin((t*d-s)*(2*pi)/p )*0.5+c+b;
				}
				break;
		}
		break;
		
	case GMU_ANIM_BOUNCE:
		switch(_ease){
			case GMU_ANIM_IN:
				t=d-t;
				t/=d;
				if (t<1/2.75){
					r=c*(7.5625*t*t);
				}else if(t<2/2.75){
					t-=1.5/2.75;
					r=c*(7.5625*t*t+0.75);
				}else if(t<2.5/2.75) {
					t-=2.25/2.75;
					r=c*(7.5625*t*t+0.9375);
				}else{
					t-=2.625/2.75;
					r=c*(7.5625*t*t +0.984375);
				}
				r=c-r+b;
				break;
			case GMU_ANIM_OUT:
				t/=d;
				if (t<1/2.75){
					r=c*(7.5625*t*t)+b;
				}else if(t<2/2.75){
					t-=1.5/2.75;
					r=c*(7.5625*t*t+0.75)+b;
				}else if(t<2.5/2.75) {
					t-=2.25/2.75;
					r=c*(7.5625*t*t+0.9375)+b;
				}else{
					t-=2.625/2.75;
					r=c*(7.5625*t*t +0.984375)+b;
				}
				break;
			case GMU_ANIM_IN_OUT:
				var ease_in;
				if(t<d/2){
					t*=2;
					ease_in=true;
				}else{
					t*=2;
					t-=d;
					ease_in=false;
				}
				
				t/=d;
				if (t<1/2.75){
					r=c*(7.5625*t*t);
				}else if(t<2/2.75){
					t-=1.5/2.75;
					r=c*(7.5625*t*t+0.75);
				}else if(t<2.5/2.75) {
					t-=2.25/2.75;
					r=c*(7.5625*t*t+0.9375);
				}else{
					t-=2.625/2.75;
					r=c*(7.5625*t*t +0.984375);
				}
				
				if(ease_in){
					r=r*0.5+b;
				}else{
					r=r*0.5+c*0.5+b;
				}
				break;
		}
		break;
}

variable_instance_set(_inst,_var_name,r);