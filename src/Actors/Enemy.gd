extends Actor


onready var stomp_area: Area2D = $StompArea2D

export var score: = 100


func _ready() -> void:
	set_physics_process(false)# neu ra khoi view thi se dung chuyen dong
	_velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	_velocity.x *= -1 if is_on_wall() else 1
	_velocity.y= move_and_slide(_velocity, FLOOR_NORMAL).y#khi ma con quai cham vao tuong thi quay dau
	


func _on_StompArea2D_area_entered(area: Area2D) -> void:
	if area.global_position.y > stomp_area.global_position.y:#khi nguoi choi vao vung va cham -> die
		return
	die()


func die() -> void:
	PlayerData.score += score
	queue_free()#xoa quai khoi man choi hiẹen tai
