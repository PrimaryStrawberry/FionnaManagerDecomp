extends AnimatedSprite2D

@onready var passivetimer = get_node("LBoobCheck")
var bust = 1


func _ready()->void :
	passivetimer.set_wait_time(0.2)
	passivetimer.start()


func _on_LBoobCheck_timeout()->void :
	if bust >= 0:
		frame = 7
	if bust >= 5:
		frame = 1
	if bust >= 10:
		frame = 2
	if bust >= 15:
		frame = 3
	if bust >= 20:
		frame = 4
	if bust >= 30:
		frame = 5
	if bust >= 50:
		frame = 6
		
	if (bust >= 0 and get_parent().strength >= 40):
		frame = 5

		
	
	if ((get_parent().strength >= 0)):
		set_offset(Vector2( - 3, - 5))
	if ((get_parent().strength >= 8)):
		set_offset(Vector2( - 3, - 5))
	if ((get_parent().strength >= 12)):
		set_offset(Vector2( - 1, - 1))
	if ((get_parent().strength >= 16)):
		set_offset(Vector2( - 1, - 1))
	if ((get_parent().strength >= 20)):
		set_offset(Vector2(0, 0))
	if ((get_parent().strength >= 26)):
		set_offset(Vector2( - 1, - 1))
	if ((get_parent().strength >= 32)):
		set_offset(Vector2( - 1, - 2))
	if ((get_parent().strength >= 40)):
		set_offset(Vector2(3, 2))
	if ((get_parent().strength >= 48)):
		set_offset(Vector2(3, 2))



