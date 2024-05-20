extends CanvasLayer

var missile_abilities = {
	"missile_1": { "cost": 100, 
	"unlocked": false},
}

var laser_abilities = {
	"double_laser": 150,
}
static var image = load('res://graphics/UI/playerLife1_blue.png')
func _ready():
	show()
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	#for key in missile_abilities:
		#print(key, missile_abilities[key])
		
		# Remove children from hbox
	for child in $GridContainer.get_children():
		child.queue_free()
	
	for i in 6:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$GridContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP

func _input(event):
	if event.is_action_pressed("skill_tree") and get_tree().paused:
		get_tree().paused = false
		hide()
	elif event.is_action_pressed("skill_tree") and !get_tree().paused:
		get_tree().paused = true
		show()

