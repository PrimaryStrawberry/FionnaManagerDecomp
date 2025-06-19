extends AnimatedSprite2D

@onready var exhale = 0
@onready var timer = get_node("Timer")
@onready var passivetimer = get_node("PassiveTimer")
@onready var dispatchtimer = get_node("Missions/ReturnDelay")
@onready var growthspurt = get_node("Growth")
@onready var growthtimer = get_node("Growth/GrowthPeak")
@onready var burstbounce = get_node("BustContainer/Bust/Bounce")


@onready var curseicon = $"/root/Node2D/Fionna/BoobCurse/AnimationPlayer"
@onready var cursetimer = get_node("CurseTimer")
#onready var musclecursetimer = get_node("MuscleCursePlayer/MuscleCurseTimer") #got rid of various muscle player refs, as this stuff does not exist.
#onready var musclecurseanim = get_node("MuscleCursePlayer")
#onready var musclecursedelay = get_node("MuscleCursePlayer/MuscleCurseDelay") this node just flat out did not exist.
@onready var curse_boob = 2
#onready var curse_muscle = 0
var curse_chance = 0

@export  var strength = 32

## Tweens
@onready var breath_tween : Tween
@onready var fionna_exit_tween : Tween

func _ready():
	timer.set_wait_time(2)
	timer.start()
	passivetimer.set_wait_time(0.2)
	passivetimer.start()
	#make tweens
	#breath_tween = get_tree().create_tween()
	#fionna_exit_tween = get_tree().create_tween()
	
func _on_Timer_timeout():
	var breathing = 7 - (strength / 10)
	if exhale == 0:
		breath_tween = create_tween()
		breath_tween.tween_property(self, "scale", get_scale() + Vector2(0.015, 0.015), breathing)
		breath_tween.play()
		exhale = 1
	else :
		breath_tween = create_tween()
		breath_tween.tween_property(self, "scale", get_scale() + Vector2( - 0.015, - 0.015), breathing)
		breath_tween.play()
		exhale = 0




func _process(_delta)->void :
	
	frame = strength / 6
	


func _on_Dispatch_pressed()->void :
	
	if get_node("Missions").missionselected >= 1:
		var steppitch = abs(32 - strength)
		var stepptichfinal = 1 - (steppitch * 0.01)
		
		$"/root/Node2D/Sounds/S_Step".pitch_scale = stepptichfinal
		$"/root/Node2D/Sounds/S_Step".playing = true
		
		fionna_exit_tween = create_tween()
		fionna_exit_tween.tween_property(self, "position", get_position() + Vector2(200, 0), 1)
		fionna_exit_tween.play()
		timer.stop()
		dispatchtimer.set_wait_time(3)
		dispatchtimer.start()
		
		$"/root/Node2D/Clipboard/Muscle_Button".disabled = true
		$"/root/Node2D/Clipboard/Fat_Button".disabled = true
		$"/root/Node2D/Clipboard/Boobs_Button".disabled = true
		$"/root/Node2D/Clipboard/Boobs_Button2".disabled = true
		$"/root/Node2D/Clipboard/Dispatch".disabled = true
		
	else :
		get_parent().get_node("Dialouge").text = "Where am I going, dingus?"
		pass



func _on_ReturnDelay_timeout()->void :
	fionna_exit_tween = create_tween()
	fionna_exit_tween.finished.connect(_on_ReturnTween_finished)
	fionna_exit_tween.tween_property(self, "position", get_position() + Vector2( - 200, 0), 4 - (strength * 0.05))
	timer.stop()
	scale = Vector2(1, 1)
	fionna_exit_tween.play()
	get_node("Missions").missionselected = 0



func _on_ReturnTween_finished() -> void:
	$"/root/Node2D/Clipboard/Muscle_Button".disabled = false
	$"/root/Node2D/Clipboard/Fat_Button".disabled = false
	$"/root/Node2D/Clipboard/Boobs_Button".disabled = false
	$"/root/Node2D/Clipboard/Boobs_Button2".disabled = false
	$"/root/Node2D/Clipboard/Dispatch".disabled = false
	curse_chance = randi() % 3
	growthtimer.set_wait_time(0.5)
	growthtimer.start()
	growthspurt.play("GrowthSpurt")
	
	
func _on_GrowthPeak_timeout()->void :
	var curse = 0
	#var targetbust = 0 #another unused variable.
	burstbounce.play("burstbounce")
	print(str(burstbounce.name))
	get_node("fionna_head").frame = 3
	
	if get_node("Missions").musclemission == 1:
		strength += 3
		
	if get_node("Missions").fatmission == 1:
		strength -= 3
		
	if get_node("Missions").boobmission == 1:
		get_node("BustContainer/Bust").bust += 2
		$"/root/Node2D/Sounds/S_SizeUp".playing = true
		print(curse_chance)
		
		if curse_chance == 2:
			get_node("BustContainer/Bust").bust += 5
			$"/root/Node2D/Sounds/S_SizeUp".playing = true
			#curse_boob == 1 #this variable is never used, only here for archival
			cursetimer.start()
			print("CURSED!!")
			
	
		
	if get_node("Missions").musclemission == 1 and curse >= 1:
		strength += 2
		$"/root/Node2D/Sounds/S_SizeUp".playing = true
		#curse_muscle == 1 #there was plans for a muscle curse! WHOA!
		#musclecursetimer.start()
		print("Buff CURSED!!")
		
		
		
	if get_node("Missions").flattenmission == 1:
		get_node("BustContainer/Bust").bust -= 5
	
		




func _on_Growth_animation_finished(_anim_name:String)->void :
	timer.set_wait_time(2)
	timer.start()



func _on_CurseTimer_timeout()->void :
	curseicon.play("BoobCurseAnim")
	var bustthresholds = [5, 10, 15, 20, 25, 30, 50]
	if get_node("BustContainer/Bust").bust == (bustthresholds[1 - 2] - 1):
		get_node("BustContainer/Bust").bust += 0.5
		burstbounce.play("burstbounce")
		$"/root/Node2D/Sounds/S_SizeUp".playing = true
		$"/root/Node2D/Sounds/S_CurseHit".playing = true
		print("Intense Curse!" + str(get_node("BustContainer/Bust").bust))
	else :
		var pitch = (2 - (get_node("BustContainer/Bust").bust / 20))
		get_node("BustContainer/Bust").bust += 0.5
		burstbounce.play("idlejiggle")
		$"/root/Node2D/Sounds/S_CurseHit".playing = true
		if pitch > 0: #added this in to prevent the console from getting flooded with errors
			$"/root/Node2D/Sounds/S_CurseHit".pitch_scale = pitch
		print("You're Cursed" + str(get_node("BustContainer/Bust").bust))


#func _on_MuscleCurseTimer_timeout()->void :
		#strength += 0.2
		#musclecurseanim.play("MuscleCurse")
		#$"/root/Node2D/Sounds/S_CurseHit".playing = true
		#$"/root/Node2D/Sounds/S_CurseHit".pitch_scale = (2 - (strength / 50))
		#timer.stop()
