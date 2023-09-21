extends AnimatedSprite

var bust = 1


func _ready()->void :
	pass
	
func _process(delta)->void :
	var highstrength = 0
	var lowstrength = 0
	var physique = $"/root/Node2D/Fionna/Body".frame
	if physique >= 9:
		highstrength = 6
	if physique <= 2:
		lowstrength = 12
	if bust < 0:
		bust = 0
	if bust >= 1:
		frame = 0
	if bust >= 5:
		frame = (1 + highstrength + lowstrength)
	if bust >= 10:
		frame = (2 + highstrength + lowstrength)
	if bust >= 15:
		frame = (3 + highstrength + lowstrength)
	if bust >= 20:
		frame = (4 + highstrength + lowstrength)
	if bust >= 30:
		frame = (5 + highstrength + lowstrength)
	if bust >= 50:
		frame = (6 + highstrength + lowstrength)
	pass





