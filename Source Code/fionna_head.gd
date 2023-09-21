extends Sprite

onready var passivetimer = get_node("BlinkTimer")
onready var updatetimer = get_node("Eyes/UpdateTimer")
onready var blinkplayer = get_node("EyeBlink")
onready var moveeyes = 0





func _ready()->void :
	passivetimer.set_wait_time((randf() * 3))
	passivetimer.start()


func _on_BlinkTimer_timeout()->void :
	if ((get_parent().strength >= 40)):
		frame = 1
		blinkplayer.play("Blink")
		passivetimer.set_wait_time((randf() * 3))
		passivetimer.start()
	elif ((get_parent().strength <= 6)):
		frame = 2
		blinkplayer.play("Blink")
		passivetimer.set_wait_time((randf() * 3))
		passivetimer.start()
	else :
		frame = 0
		blinkplayer.play("Blink")
		passivetimer.set_wait_time((randf() * 3))
		passivetimer.start()


func _process(delta:float)->void :
	if ((get_parent().strength <= 48)):
		set_offset(Vector2(0, 0))
		moveeyes = 0
	if ((get_parent().strength >= 48)):
		set_offset(Vector2( - 3, - 2))
		moveeyes = 1
		

func _on_Growth_animation_started(anim_name:String)->void :
	passivetimer.stop()
	blinkplayer.play("Closed")


func _on_Growth_animation_finished(anim_name:String)->void :
	frame = 3
	passivetimer.set_wait_time((randf() * 3))
	passivetimer.start()

