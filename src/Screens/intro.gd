extends RichTextLabel
var dialog = ["Intro: Collecting the coin and finding the portal to come next levels. You can jum up a head of some monsters to kill it. If you touch the body of monster, you die"]

func _ready():
	pass # Replace with function body.
	set_bbcode(dialog[0])
	set_visible_characters(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
