extends CanvasLayer

var missile_abilities = {
  "missile_1": {
	"cost": 10,
	"unlocked": false,
	"image": "res://graphics/Upgrades/missile_1.png",
	"rotation": 0,
  },
  "missile_2": {
	"cost": 250,
	"unlocked": false,
	"image": "res://graphics/Upgrades/missile_2d.png",
	"rotation": 0,
  }
}

var laser_abilities = {
	"double_laser": 150,
}
static var image = load("res://graphics/Missile/spr_missile.png")
var hovered_upgrade = ""

func _ready():
	var grid_missiles = $MarginContainer/Categories/VBoxContainer/Missiles/VBoxContainer/MarginContainer/GridContainer
	#show()
	process_mode = Node.PROCESS_MODE_ALWAYS
	# Set Score / Currency
	# Remove children from hbox
	for child in grid_missiles.get_children():
		child.queue_free()
	
	for upg in missile_abilities:
		var background = ColorRect.new()
		background.color = Color(Color.WEB_GRAY)
		missile_abilities[upg]["background_object"] = background
		background.custom_minimum_size = Vector2(100, 100)
		background.connect("mouse_entered", _on_ability_mouse_entered.bind(upg))
		background.connect("mouse_exited", _on_ability_mouse_exited.bind(upg))
		
		
		var margin_container = MarginContainer.new()
		margin_container.set_anchors_and_offsets_preset(Control.PRESET_CENTER)

		var spr = Sprite2D.new()
		spr.texture = load(missile_abilities[upg]["image"])
		spr.centered = true
		spr.rotation_degrees = missile_abilities[upg]["rotation"]
		
		margin_container.add_child(spr)
		background.add_child(margin_container)
		
		var cost = Label.new()
		cost.text = str(missile_abilities[upg]["cost"])
		
		background.add_child(cost)
		grid_missiles.add_child(background)
		

func _input(event):
	if event.is_action_pressed("skill_tree") and get_tree().paused:
		get_tree().paused = false
		hide()
	elif event.is_action_pressed("skill_tree") and !get_tree().paused:
		$Score.text = "Cash: " + str(int(Global.score))
		get_tree().paused = true
		show()
		
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if hovered_upgrade != "" and not missile_abilities[hovered_upgrade]["unlocked"]:
			if Global.score >= missile_abilities[hovered_upgrade]["cost"]:
				Global.score -= missile_abilities[hovered_upgrade]["cost"]  
				$Score.text = "Cash: " + str(int(Global.score))
				missile_abilities[hovered_upgrade]["unlocked"] = true
				Global.max_missiles += 3

func _on_ability_mouse_entered(upgrade):
	missile_abilities[upgrade]["background_object"].color = Color(0, 0, 255, .6) if missile_abilities[upgrade]["unlocked"] else Color(Color.DIM_GRAY, .8)
	hovered_upgrade = upgrade
	#colorRect.custom_minimum_size = Vector2(110, 110)
	
func _on_ability_mouse_exited(upgrade):
	missile_abilities[upgrade]["background_object"].color = Color(0, 0, 255) if missile_abilities[upgrade]["unlocked"] else Color(Color.WEB_GRAY)
	hovered_upgrade = ""
	#colorRect.custom_minimum_size = Vector2(100, 100)

