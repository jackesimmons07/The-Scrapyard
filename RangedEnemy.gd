extends KinematicBody2D

var lives = 3
var velocity = Vector2()
var movingUp = true

var isDead = false

func dead():
	isDead = true
	velocity = Vector2()
	queue_free()

func health():
	if lives > 0:
		lives -= 1
	if lives == 0:
		dead()

func _physics_process(delta):
	if movingUp:
		velocity.y = 1
		if self.position.y < 0:
			velocity.y = 0
			movingUp = false
	else:
		velocity.y += 1
		if self.position.y > 600:
			velocity.y = 0
			movingUp = false
	velocity = move_and_slide(velocity)
