extends CharacterBody2D

@export var speed := 500
var can_shoot := true
var is_paused := true
signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

	# If player is shooting
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LaserBarrel.global_position)
		can_shoot = false
		$LaserTimer.start()
		$LaserSound.play()
		

func _on_laser_timer_timeout():
	can_shoot = true
