extends CharacterBody2D


const SPEED = 500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_pressed("left"):
		velocity.x += -50
		$AnimatedSprite2D.play("walk")
	if Input.is_action_pressed("right"):
		velocity.x += 50
		$AnimatedSprite2D.play("walk")
	
		

	move_and_slide()
