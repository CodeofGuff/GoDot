extends CharacterBody2D


@export var bullet: PackedScene

# Variables
var speed = 225
var gravity = 1200
var jump_force = -600
var jump_count = 0
var extrajumps = 1  #if Input.is_action_just_pressed("accept"): extrajumps += 1
var can_shoot: bool = true

func _ready():
	%Animations.play("idle")
	%Smoke.play("idle")
	
func _physics_process(delta):
	player_movement(delta)
	player_jump(delta)
	spawn_bullet()
	
	
	# Applying gravity
	velocity.y += gravity * delta
	
	# hello world
	# hello world from Laptop

	
func player_movement(delta):
	velocity.x = 0
	if Input.is_action_pressed("left"):
		velocity.x -= speed
		%Animations.flip_h = true
		%Smoke.flip_h = true
		%Animations.play("run")
	elif Input.is_action_pressed("right"):
		velocity.x += speed
		%Animations.flip_h = false
		%Smoke.flip_h = false
		%Animations.play("run")
		
	# Applying gravity
	velocity.y += gravity * delta
	
	if velocity.x == 0 and is_on_floor():
		%Animations.play("idle")
	
	move_and_slide()
	
func player_jump(delta):
	
	if Input.is_action_just_pressed("jump") && jump_count < extrajumps:
			velocity.y = jump_force
			jump_count += 1
		
	if is_on_floor(): 
		jump_count = 0
		
func spawn_bullet():
	if can_shoot:
		if Input.is_action_just_pressed("attack"):
			var bullet_instance = bullet.instantiate()
			bullet_instance.global_transform = global_transform
			get_parent().add_child(bullet_instance)
			can_shoot = false
			await get_tree().create_timer(1).timeout
			can_shoot = true
	
