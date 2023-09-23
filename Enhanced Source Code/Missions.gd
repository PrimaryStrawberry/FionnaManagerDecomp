extends Node

onready var dispatchtimer = get_node("ReturnDelay")

var musclemission = 0
var fatmission = 0
var boobmission = 0
var flattenmission = 0

var missionselected = 0

func _ready()->void :
	pass


func _on_Dispatch_pressed()->void :
	if missionselected == 0:
		pass
	else :
		missionselected = true
		dispatchtimer.set_wait_time(2)
		dispatchtimer.start()

func _on_ReturnDelay_timeout()->void :
	pass

func _on_DepartTween_tween_completed(_object, _key)->void :
	pass
	
	
	
	
	
	
	
	
	
	




func _on_MuscleMission()->void :
	musclemission = 1
	fatmission = 0
	boobmission = 0
	flattenmission = 0
	missionselected = 1

func _on_FatMission()->void :
	musclemission = 0
	fatmission = 1
	boobmission = 0
	flattenmission = 0
	missionselected = 1


func _on_BoobsMission()->void :
	musclemission = 0
	fatmission = 0
	boobmission = 1
	flattenmission = 0
	missionselected = 1


func _on_FlattenMission()->void :
	musclemission = 0
	fatmission = 0
	boobmission = 0
	flattenmission = 1
	missionselected = 1

func _on_ReturnTween_tween_completed(_object:Object, _key:NodePath)->void :
	musclemission = 0
	fatmission = 0
	boobmission = 0
	flattenmission = 0
	missionselected = 0
