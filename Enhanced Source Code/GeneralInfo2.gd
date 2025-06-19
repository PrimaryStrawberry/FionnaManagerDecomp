extends Label



func _ready()->void :
	text = "Breasts: ~0mL"

func update_breast_ml() -> void:
		var rng = RandomNumberGenerator.new()
		var bust = $"/root/Node2D/Fionna/Body/BustContainer/Bust".bust
		var totalbust = (bust * 100 + rng.randi() % 100)
		text = "Breasts: ~" + str(totalbust) + "mL"

func _on_Growth_animation_finished(_anim_name:String)->void :
	if $"/root/Node2D/Fionna/Body/Missions".boobmission == 1:
		update_breast_ml()


func _on_CurseTimer_timeout()->void :
		update_breast_ml()
