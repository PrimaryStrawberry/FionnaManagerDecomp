extends AnimatedSprite


onready var updatetimer = get_node("UpdateTimer")





func _ready()->void :
	pass

func _process(delta:float)->void :
	if ((get_parent().moveeyes == 0)):
		set_offset(Vector2(0, 0))
	if ((get_parent().moveeyes >= 1)):
		set_offset(Vector2( - 3, - 2))
