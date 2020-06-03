extends Actor
export var score: = 100



func die() -> void:
	PlayerData.score += score
	queue_free()
