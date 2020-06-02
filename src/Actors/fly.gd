extends "res://src/Actors/Actor.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)# neu ra khoi view thi se dung chuyen dong
func _physics_process(delta: float) -> void:
	_velocity.y *= 1 if is_on_wall() else -1
	_velocity.y= move_and_slide(_velocity, FLOOR_NORMAL).y#khi ma con quai cham vao tuong thi reset gia tri cua truc x ve 0
	

