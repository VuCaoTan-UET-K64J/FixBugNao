extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"





func _on_playnow_pressed():
	queue_free()
	get_tree().change_scene("res://src/Screens/MainScreen.tscn")
