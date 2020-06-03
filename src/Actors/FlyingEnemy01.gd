extends Actor


onready var stomp_area: Area2D = $StompArea2D


	


func _physics_process(delta: float) -> void:
	_velocity.y *= -1 if is_on_ceiling() or is_on_floor() else 1
	_velocity.x = move_and_slide(_velocity, FLOOR_NORMAL).x


func _on_StompArea2D_area_entered(area: Area2D) -> void:
	if area.global_position.y > stomp_area.global_position.y:
		return
	die()


func die() -> void:
	queue_free()
