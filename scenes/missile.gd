extends Area2D

@export var speed = 500
var initial_boost = 0.0
var initial_slide = 1 if Global.player_velocity[0] > 0 else -1
var slide_amount = 12 * initial_slide if Global.player_velocity[0] != 0 else 0

var slider_val = .5

func _ready():
	var tween = create_tween()
	tween.tween_property($Sprite2D, 'scale', Vector2(1,1), 0.1).from(Vector2(0,0))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(initial_boost < 2.2):
		initial_boost += .02
	
	if(slide_amount < 0):
		slide_amount += slider_val
	if(slide_amount > 0):
		slide_amount -= slider_val
	position -= Vector2(-slide_amount, speed*delta*initial_boost)

