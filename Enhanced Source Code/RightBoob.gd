extends AnimatedSprite2D

@onready var passivetimer = get_node("RBoobCheck")
var bust = 1


func _ready()->void :
	passivetimer.set_wait_time(0.2)
	passivetimer.start()
	
	
func _on_RBoobCheck_timeout()->void :
	if (bust >= 0 and get_parent().strength < 40):
		frame = 0
	if bust >= 5:
		frame = 1
	if bust >= 10:
		frame = 2
	if (bust <= 4 and get_parent().strength >= 40):
		frame = 3
		
		
	
	if ((get_parent().strength >= 0)):
		set_offset(Vector2(8, - 5))
	if ((get_parent().strength >= 8)):
		set_offset(Vector2(8, - 5))
	if ((get_parent().strength >= 12)):
		set_offset(Vector2(1, - 1))
	if ((get_parent().strength >= 16)):
		set_offset(Vector2(0, - 1))
	if ((get_parent().strength >= 20)):
		set_offset(Vector2(0, 0))
	if ((get_parent().strength >= 26)):
		set_offset(Vector2(1, - 1))
	if ((get_parent().strength >= 32)):
		set_offset(Vector2(1, - 2))
	if ((get_parent().strength >= 40)):
		set_offset(Vector2(17, - 1))



