extends Area2D

var fall_speed := 1200
var stopped := false

func _process(delta: float) -> void:
	if not stopped:
		position.y += fall_speed * delta

func stop():
	stopped = true
	
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Floor"):
		stop()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Floor"):
		stop()
