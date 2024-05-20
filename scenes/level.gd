extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

var health := 3

func _ready():
	Global.score = 0
	get_tree().call_group('ui', 'set_health', health)
	
func _on_meteor_timer_timeout():
	var meteor = meteor_scene.instantiate()
	
	$Meteors.add_child(meteor)
	
	# Connect signal
	meteor.connect('collision', _on_meteor_collision)

func _on_meteor_collision():
	health -= 1
	get_tree().call_group('ui', 'set_health', health)
	$LoseHealthSound.play()
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/gameOver.tscn")
	
	
func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
