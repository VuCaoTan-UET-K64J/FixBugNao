extends Actor


export var stomp_impulse: = 600.0
var lefticon = preload("res://assets/asset-godot/player1.1.png")
var righticon = preload("res://assets/asset-godot/player1.0.png")

func _on_StompDetector_area_entered(area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)


func _on_EnemyDetector_body_entered(body: PhysicsBody2D) -> void:#va cham voi quai la chet

	die()


func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	var snap: Vector2 = Vector2.DOWN * 60.0 if direction.y == 0.0 else Vector2.ZERO
	_velocity = move_and_slide_with_snap(
		_velocity, snap, FLOOR_NORMAL, true# floor_normal =vector2(0,-1)
	)
	if Input.is_action_pressed("move_left"): get_node("Sprite").set_texture(lefticon)
	elif Input.is_action_pressed("move_right"): get_node("Sprite").set_texture(righticon)


func get_direction() -> Vector2:# ham nhan vao nút di chuyểen
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-Input.get_action_strength("jump") if is_on_floor() and Input.is_action_just_pressed("jump") else 0.0
	)# tra ve vector 2 chieu  truc y neu is_on_floor== true 	


func calculate_move_velocity(# ham cha ve toc do
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool #test cmt
	) -> Vector2:
	var velocity: = linear_velocity
	velocity.x = speed.x * direction.x
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		velocity.y 
	return velocity


func calculate_stomp_velocity(linear_velocity: Vector2, stomp_impulse: float) -> Vector2:
	var stomp_jump: = -speed.y if Input.is_action_pressed("jump") else -stomp_impulse
	return Vector2(linear_velocity.x, stomp_jump)


func die() -> void:
	PlayerData.deaths += 1
	queue_free()
