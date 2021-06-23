extends KinematicBody2D

var velocity = Vector2()
var speed = 200 # how fast character will move in pixels

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	velocity = velocity.normalized() * 200 # makes the character move quicker
	
func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
