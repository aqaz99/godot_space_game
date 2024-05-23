extends CharacterBody2D

@export var speed := 500
var can_shoot := true
var is_paused := true
signal laser(pos)
signal missile(pos, velocity)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	Global.player_velocity = velocity
	move_and_slide()

	# If player is shooting
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LaserBarrel.global_position)
		can_shoot = false
		$LaserTimer.start()
		$LaserSound.play()
		
	if Input.is_action_just_released("click") and Global.max_missiles > 0:
		if Global.current_missiles > 0:
			print("Firing")
			Global.current_missiles -= 1
			missile.emit($LaserBarrel.global_position, velocity)
			

func _on_laser_timer_timeout():
	can_shoot = true

func _on_missile_timer_timeout():
	if Global.current_missiles < Global.max_missiles:
		Global.current_missiles += 1
