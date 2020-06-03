extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	for button in get_tree().get_nodes_in_group("level"):
		button.connect("pressed", self, "_on_level_pressed", [button])
func _on_level_pressed(button):
	var level = "res://src/Levels/"
	level = level + button.name+".tscn"
	get_tree().change_scene(level)
	level=""


func _on_Button_pressed():
	get_tree().change_scene("res://src/Screens/MainScreen.tscn")
