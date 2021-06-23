extends KinematicBody2D

var velocity = Vector2()
var speed = 200 # how fast character will move in pixels
const PROJECTILE = preload("res://GrayProjectile.tscn")

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

	if Input.is_action_just_pressed("shoot"):
		var projectile = PROJECTILE.instance()
		get_parent().add_child(projectile)
		projectile.position = $Position2D.global_position

# infinite memory
#for(;;) {
#	malloc(1);
#}
# problem?


















# ♫ You were the part of the picture/I can't recall/You were part of the skyline/I felt so small/You were the part of the picture/I can't recall ♫
