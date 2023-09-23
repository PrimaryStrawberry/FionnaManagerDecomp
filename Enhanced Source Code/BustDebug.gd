extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _update():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Add_Bust_pressed():
	text = "Bust:" + str($"/root/Node2D/Fionna/Body/BustContainer/Bust".bust)
