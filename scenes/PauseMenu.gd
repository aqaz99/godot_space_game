extends CanvasLayer

func _ready():
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event):
	if event.is_action_pressed("pause") and get_tree().paused:
		get_tree().paused = false
		hide()
	elif event.is_action_pressed("pause") and !get_tree().paused:
		get_tree().paused = true
		show()
		
