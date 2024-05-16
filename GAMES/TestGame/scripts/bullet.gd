extends Area2D

var speed = 200
const RANGE = 400
var travelled_distance = 0

func _physics_process(delta):
	%AnimatedSprite2D.play("main")
	position += transform.x * speed * delta

	
	travelled_distance += speed * delta
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
