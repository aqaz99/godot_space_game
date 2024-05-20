extends CanvasLayer

@export var level_scene: PackedScene 

func _ready():
	$MarginContainer/Score.text = "Score: " + str(Global.score)
	$GameOverSound.play()
	
func _input(event):
	if event.is_action_pressed("shoot"):
		get_tree().change_scene_to_packed(level_scene)
	
