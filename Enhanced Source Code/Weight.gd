extends Label








func _ready()->void :
	var strength = $"/root/Node2D/Fionna/Body".strength
	var bust = $"/root/Node2D/Fionna/Body/Bust".bust
	var weightdiff = abs(strength - 32) - 1
	var weight = 110 + (weightdiff * 5 + bust * 3) + ((randi() % 10) * 0.1)
	text = str(weight) + " lbs."
	print(weight)

func _on_Growth_animation_finished(anim_name:String)->void :
	var strength = $"/root/Node2D/Fionna/Body".strength
	var bust = $"/root/Node2D/Fionna/Body/Bust".bust
	var weightdiff = abs(strength - 32) - 1
	var weight = 110 + (weightdiff * 5 + bust * 3) + ((randi() % 10) * 0.1)
	text = str(weight) + " lbs."
	print(weight)
	
func _on_CurseTimer_timeout()->void :
	var strength = $"/root/Node2D/Fionna/Body".strength
	var bust = $"/root/Node2D/Fionna/Body/Bust".bust
	var weightdiff = abs(strength - 32) - 1
	var weight = 110 + (weightdiff * 5 + bust * 3) + ((randi() % 10) * 0.1)
	text = str(weight) + " lbs."
	print(weight)
