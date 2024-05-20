extends CanvasLayer
static var image = load('res://graphics/UI/playerLife1_blue.png') 
func set_health(amount):
	# Remove children from hbox
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
	


func _on_score_timer_timeout():
	Global.score += .25
	$MarginContainer/Score.text = str(int(Global.score))
