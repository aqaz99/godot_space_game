extends CanvasLayer

var missile_abilities = {
	"missile_1": { "cost": 100, 
	"unlocked": false},
}

var laser_abilities = {
	"double_laser": 150,
}

func _ready():
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	for key in missile_abilities:
		print(key, missile_abilities[key])

func _input(event):
	if event.is_action_pressed("skill_tree") and get_tree().paused:
		get_tree().paused = false
		hide()
	elif event.is_action_pressed("skill_tree") and !get_tree().paused:
		get_tree().paused = true
		show()

