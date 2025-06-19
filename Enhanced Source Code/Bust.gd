extends AnimatedSprite2D

var bust = 1
#onready var BustContainer = get_node("/root/Node2D/Fionna/Body/BustContainer")

func _ready()->void :
	pass
	
func _process(_delta)->void :
	self.scale = Vector2(1,1)
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
		self.scale = Vector2(1,1)
		frame = (1 + highstrength + lowstrength)
		self.scale = Vector2(interpolateScale(bust, 5, 10, 1, 1.1), interpolateScale(bust, 5, 10, 1, 1.1))
	if bust >= 10:
		self.scale = Vector2(1,1)
		frame = (2 + highstrength + lowstrength)
		self.scale = Vector2(interpolateScale(bust, 10, 15, 1, 1.15), interpolateScale(bust, 10, 15, 1, 1.15))
	if bust >= 15:
		self.scale = Vector2(1,1)
		frame = (3 + highstrength + lowstrength)
		self.scale = Vector2(interpolateScale(bust, 15, 20, 1, 1.2), interpolateScale(bust, 15, 20, 1, 1.2))
	if bust >= 20:
		self.scale = Vector2(1,1)
		frame = (4 + highstrength + lowstrength)
		self.scale = Vector2(interpolateScale(bust, 20, 30, 1, 1.25), interpolateScale(bust, 20, 30, 1, 1.25))
	if bust >= 30:
		self.scale = Vector2(1,1)
		frame = (5 + highstrength + lowstrength)
		self.scale = Vector2(interpolateScale(bust, 30, 50, 1, 1.3), interpolateScale(bust, 30, 50, 1, 1.3))
	if bust >= 50:
		self.scale = Vector2(1,1)
		frame = (6 + highstrength + lowstrength)
		self.scale = Vector2(interpolateScale(bust, 50, 60, 1, 1.35), interpolateScale(bust, 50, 60, 1, 1.35))
	if bust >= 60:
		self.scale = Vector2(1,1)
		frame = (6 + highstrength + lowstrength)
		self.scale = Vector2(bust/44.44,bust/44.44)
	#print("scale:" + str(self.scale))
	pass

#added for the frame interpolation, feel free to steal this code
func interpolateScale(input_value, input_min, input_max, output_min, output_max):
	 # Ensure input_value is within the input range
	input_value = clamp(input_value, input_min, input_max)
	
	# Calculate the percentage of input_value within the input range
	var input_range = input_max - input_min
	var output_range = output_max - output_min
	
	# Map the input_value to the output range
	var mapped_value = (input_value - input_min) / input_range
	mapped_value = output_min + (mapped_value * output_range)
	return mapped_value
