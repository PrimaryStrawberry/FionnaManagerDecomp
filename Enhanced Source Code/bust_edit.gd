extends LineEdit

var editing : bool

func _ready() -> void:
	text = str($"/root/Node2D/Fionna/Body/BustContainer/Bust".bust)

func update_bust(new_value : float) -> void:
	var bust_node = $"/root/Node2D/Fionna/Body/BustContainer/Bust"
	var tween = create_tween()
	tween.tween_property(bust_node, "bust", new_value, 1)
	$"/root/Node2D/Clipboard/Breasts".update_breast_ml()

func _on_text_submitted(new_text: String) -> void:
	update_bust(float(new_text))

func _on_text_changed(new_text: String) -> void:
	update_bust(float(new_text))

func _process(_delta: float) -> void:
	if !editing:
		text = str($"/root/Node2D/Fionna/Body/BustContainer/Bust".bust)
		



func _on_editing_toggled(toggled_on: bool) -> void:
	editing != toggled_on
