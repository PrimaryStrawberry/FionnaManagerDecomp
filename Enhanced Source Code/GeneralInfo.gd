extends Label








func _ready()->void :
	text = "Physique: Fit"

func _on_Growth_animation_finished(_anim_name:String)->void :
	var strength = $"/root/Node2D/Fionna/Body".frame
	var strengthdescription = [
	"Blubbery", 
	"Chunky", 
	"Tubby", 
	"Chubby", 
	"Soft", 
	"Fit", 
	"Toned", 
	"Buff", 
	"Huge", 
	"Hulking", 
	"Massive"
	]
	text = "Physique: " + strengthdescription[strength]
