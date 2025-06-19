extends Node


@onready var strength = $"/root/Node2D/Fionna/Body".strength



func _ready()->void :
	pass

func _on_GrowthPeak_timeout()->void :
	print("Is already playing")
	$"/root/Node2D/Sounds/S_MuscleChange".playing = true
	$"/root/Node2D/Sounds/S_MuscleChange".pitch_scale = (2 - strength / 50)
