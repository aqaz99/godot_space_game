extends CanvasLayer
static var life_image = load('res://graphics/UI/playerLife1_blue.png')
static var missile_image = load('res://graphics/Missile/spr_missile_half.png')

func set_health(amount):
	# Remove children from hbox
	for child in $LifeContainer/HBoxContainer.get_children():
		child.queue_free()
	
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = life_image
		$LifeContainer/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		
	
func _on_score_timer_timeout():
	Global.score += .25
	$MarginContainer/Score.text = str(int(Global.score))

func _on_missile_timer_timeout():
	for child in $MissileContainer/HBoxContainer.get_children():
		child.queue_free()
		
	for i in Global.current_missiles:
		var text_rect = TextureRect.new()
		text_rect.texture = missile_image
		$MissileContainer/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
