extends Area2D

var velocity = Vector2()
const SPEED = 350

var direction = 1

func set_direction(dir):
	direction = dir
	if dir == -1:
		self.scale *= -1

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)

func _on_visibilityNotifier_screen_exited():
	queue_free()

func _on_GrayProjectile_body_entered(body):
	if "Tile1" in body.name:
		return
	if "Player" in body.name:
		return
	if "Enemy" in body.name:
		body.health()
		queue_free()
	if "Tile2" in body.name:
		queue_free()
	if "Tile3" in body.name:
		queue_free()
	if "Tile4" in body.name:
		queue_free()
	if "Ammo" in body.name:
		return
