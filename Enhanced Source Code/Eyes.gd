extends AnimatedSprite


#onready var updatetimer = get_node("UpdateTimer")
#the timer does not exist



func _ready()->void :
	pass

func _process(_delta:float)->void :
	if ((get_parent().moveeyes == 0)):
		set_offset(Vector2(0, 0))
	if ((get_parent().moveeyes >= 1)):
		set_offset(Vector2( - 3, - 2))
