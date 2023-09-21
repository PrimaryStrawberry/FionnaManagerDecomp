extends Button

onready var camera2 = get_node("../ThirdPersonCamera")







func _ready()->void :
	pass

func _process(delta):
	if get_node("root/Node2D/Fionna/Body").fionna_departed == 1:
		print("fionna is gone")





