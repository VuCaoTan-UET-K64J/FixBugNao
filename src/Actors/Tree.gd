extends Actor


onready var stomp_area: Area2D = $StompArea2D

export var score: = 100


func _on_StompArea2D_area_entered(area: Area2D) -> void:
	if area.global_position.y > stomp_area.global_position.y:
		return
	die()


func die() -> void:
	PlayerData.score += score
	queue_free()
