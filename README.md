GMU_Anim (v2.0.0)
=====
简介
-----
本插件用于简化实例变量缓动的过程，旨在使用一个函数，即可完成复杂的缓动过程。<br>
适用版本：Gamemaker Studio 2

安装
-----
将文件下载到本地后
1. 手动添加 Scripts 文件夹内的文件到资源列表的Scripts分类内；或可复制文件内容，手动添加同名Scrpit，将内容粘贴入Script。
2. 手动创建以“_gmu_anim”（不带引号）为名称的Object，手动创建与 Objects\\_gmu_anim\\ 文件夹内文件的同名事件，并将文件内容复制粘贴进相应事件中。

简单使用
-----
若要为房间内某个实例或某个Object添加缓动，只需执行`一次`GMU_Anim_New(...)函数即可为指定实例添加缓动。
```cpp
GMU_Anim_New(target, "x", GMU_ANIM.QUAD, GMU_ANIM.OUT, 100, 200, 15, 30);
```
使`target`物体的所有实例的`x`变量，使用`EaseOutQuart`效果，在15帧内从100增大200，延迟30帧执行。<br>
`GMU_ANIM.QUAD`和`GMU_ANIM.OUT`均为插件的自定义枚举常量，详见`枚举常量`部分。<br>
本插件支持 www.easings.net 中列出的所有缓动效果。

函数
-----
* GMU_Anim_Init();
	* 描述
		* 声明枚举常量，无需调用该函数

* GMU_Anim_New(inst/obj, var_name, tween, ease, start, change, duration, delay*, arg1*, arg2*);
	* 描述
		* 创建缓动实例
	* inst/obj
		* 目标实例或物体
	* var_name
		* 变量名称
	* tween
		* tween效果，详见`枚举常量`部分
	* ease
		* ease效果，详见`枚举常量`部分
	* start
		* 起始值
	* change
		* 变更值
	* duration
		* 持续时间
	* delay（可选）
		* 延迟
	* arg1（可选）
		* 附加参数 1
	* arg2（可选）
		* 附加参数 2
	* 返回值
		* 缓动实例；若有多个目标实例，则会返回数组

* GMU_Anim_Stop(anim_inst/inst/obj, var_name*);
	* 描述
		* 终止目标缓动实例
	* anim/inst/obj
		* 目标缓动实例/实例/物体
	* var_name（可选）
		* 变量名称，若填写，则只停止作用在该变量上的缓动实例
	* 返回值
		* 是否有缓动实例被终止

* GMU_Anim_Skip(anim_inst/inst/obj, var_name*);
	* 描述
		* 提前结束目标缓动实例
	* anim/inst/obj
		* 目标缓动实例/实例/物体
	* var_name（可选）
		* 变量名称，若填写，则只提前结束作用在该变量上的缓动实例
	* 返回值
		* 是否有缓动实例被提前结束。

* GMU_Anim_IsExists(anim_inst/inst/obj, var_name*);
	* 描述
		* 查询目标缓动实例是否存在
	* anim/inst/obj
		* 目标缓动实例/实例/物体
	* var_name（可选）
		* 变量名称，若填写，则只查询作用在该变量上的缓动实例
	* 返回值
		* 缓动实例是否存在。

枚举常量
-----
tween效果
-----
0. GMU_ANIM.LINEAR
1. GMU_ANIM.SINE
2. GMU_ANIM.QUAD
3. GMU_ANIM.CUBIC
4. GMU_ANIM.QUART
5. GMU_ANIM.QUINT
6. GMU_ANIM.EXPO
7. GMU_ANIM.CIRC
8. GMU_ANIM.BACK
9. GMU_ANIM.ELASTIC
10. GMU_ANIM.BOUNCE

ease效果
-----
11. GMU_ANIM.IN
12. GMU_ANIM.OUT
13. GMU_ANIM.IN_OUT

您可以在 www.easings.net 观看不同的缓动效果。
