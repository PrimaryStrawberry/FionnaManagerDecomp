extends Node


var bust = 0



func _ready()->void :
	pass



func _Breast_Spectrum()->void :
	
	if (bust >= 0):
		frame = 0
	if (bust >= 5):
		frame = 1
	if (strength >= 20):
		frame = 2
	if (strength >= 30):
		frame = 3
	if (strength >= 40):
		frame = 4

