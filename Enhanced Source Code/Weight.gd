extends Label







#added the updateWeight function to make it easier to read or something, idk.
func _ready()->void :
	updateWeight()

func _on_Growth_animation_finished(_anim_name:String)->void :
	updateWeight()
	
func _on_CurseTimer_timeout()->void :
	updateWeight()
	
func updateWeight():
	var strength = $"/root/Node2D/Fionna/Body".strength
	var bust = $"/root/Node2D/Fionna/Body/BustContainer/Bust".bust
	var weightdiff = abs(strength - 32) - 1
	var weight = 110 + (weightdiff * 5 + bust * 3) + ((randi() % 10) * 0.1)
	text = str(weight) + " lbs."
	print(weight)
