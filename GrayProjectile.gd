extends KinematicBody2D

var velocity = Vector2()
const SPEED = 220

func _physics_process(delta):
	velocity.x = SPEED*delta
