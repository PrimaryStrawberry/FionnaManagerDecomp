extends Camera2D

@onready var bust_container := $"/root/Node2D/Fionna/Body/BustContainer/Bust"

const SCREEN_PADDING := 50.0
const ZOOM_SPEED := 5.0

func _process(delta: float) -> void:
	var bounds := get_bounding_rect(bust_container)
	var center := bounds.position + bounds.size / 2.0

	# Calculate zoom based on bounding box size
	var viewport_size := get_viewport_rect().size
	var zoom_x := (bounds.size.x + SCREEN_PADDING * 2.0) / viewport_size.x
	var zoom_y := (bounds.size.y + SCREEN_PADDING * 2.0) / viewport_size.y
	var target_zoom = Vector2.ONE * max(zoom_x, zoom_y, 0.01)

	# Smoothly update position and zoom
	global_position = global_position.lerp(center, ZOOM_SPEED * delta)
	zoom = zoom.lerp(target_zoom, ZOOM_SPEED * delta)


func get_bounding_rect(node: Node2D) -> Rect2:
	var min_pos := Vector2(INF, INF)
	var max_pos := Vector2(-INF, -INF)

	for child in node.get_children():
		if child is Node2D:
			var pos := (child as Node2D).global_position
			min_pos.x = min(min_pos.x, pos.x)
			min_pos.y = min(min_pos.y, pos.y)
			max_pos.x = max(max_pos.x, pos.x)
			max_pos.y = max(max_pos.y, pos.y)

	return Rect2(min_pos, max_pos - min_pos)
