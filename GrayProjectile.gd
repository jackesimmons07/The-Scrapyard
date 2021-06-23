extends KinematicBody2D

var velocity = Vector2()
const SPEED = 220

func _physics_process(delta):
	velocity.x = SPEED * delta
	translate(velocity)

func _on_visibilityNotifier_screen_exited():
	queue_free()
