tool
extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer

export var next_scene: PackedScene#next scene


func _on_body_entered(body: PhysicsBody2D):#neu va cham thi goi ham teleport
	teleport()


func _get_configuration_warning() -> String:# ham canh bao neu portal khong duoc lien ket voi screen( ham nay chi de lam mau)
	return "The Next Level can't be empty" if not next_scene else ""


func teleport() -> void:#ham teleport dich chuyen den man sau
	anim_player.play("fade_out")
	yield(anim_player, "animation_finished")# ham nay se dung teleport cho den khi namination ket thuc
	get_tree().change_scene_to(next_scene)#ham get tree luu tat cac cac tree cua game
