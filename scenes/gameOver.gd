extends CanvasLayer

@export var level_scene: PackedScene 

func _ready():
	$MarginContainer/Score.text = "Score: " + str(int(Global.score))
	$GameOverSound.play()
	
func _input(event):
	if event.is_action_pressed("shoot"):
		Global.max_missiles = 0
		Global.current_missiles = 0
		get_tree().change_scene_to_packed(level_scene)
	
