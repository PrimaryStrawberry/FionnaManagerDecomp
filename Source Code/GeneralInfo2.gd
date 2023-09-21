extends Label



func _ready()->void :
	text = "Breasts: ~0mL"

func _on_Growth_animation_finished(anim_name:String)->void :
	if $"/root/Node2D/Fionna/Body/Missions".boobmission == 1:
		var rng = RandomNumberGenerator.new()
		var bust = $"/root/Node2D/Fionna/Body/Bust".bust
		var totalbust = (bust * 100 + randi() % 100)
		text = "Breasts: ~" + str(totalbust) + "mL"


func _on_CurseTimer_timeout()->void :
		var rng = RandomNumberGenerator.new()
		var bust = $"/root/Node2D/Fionna/Body/Bust".bust
		var totalbust = (bust * 100 + randi() % 100)
		text = "Breasts: ~" + str(totalbust) + "mL"
