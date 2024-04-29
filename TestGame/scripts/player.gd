extends CharacterBody2D


# Variables
var speed = 225
var gravity = 1000
var jump_force = -600
var jump_count = 0
var extrajumps = 1  #if Input.is_action_just_pressed("accept"): extrajumps += 1

func _ready():
	%AnimatedSprite2D.play("idle")

func _physics_process(delta):
	player_movement(delta)
	player_jump(delta)

	
	# Applying gravity
	velocity.y += gravity * delta

	
func player_movement(delta):
	velocity.x = 0
	if Input.is_action_pressed("left"):
		velocity.x -= speed
		%AnimatedSprite2D.flip_h = true
		%AnimatedSprite2D.play("run")
	elif Input.is_action_pressed("right"):
		velocity.x += speed
		%AnimatedSprite2D.flip_h = false
		%AnimatedSprite2D.play("run")
		
	# Applying gravity
	velocity.y += gravity * delta
	
	if velocity.x == 0 and is_on_floor():
		%AnimatedSprite2D.play("idle")
	
	move_and_slide()
	
func player_jump(delta):
	
	if Input.is_action_just_pressed("jump") && jump_count < extrajumps:
			velocity.y = jump_force
			jump_count += 1
		
	if is_on_floor(): 
		jump_count = 0


