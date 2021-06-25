extends KinematicBody2D

export(int) var SPEED: int = 80
var lives = 3
var velocity = Vector2()
var movingUp = true
var path: Array = []
var levelNavigation: Navigation2D = null
var player = null

onready var line2d = $Line2D

var isDead = false

func _ready():
	yield(get_tree(), "idle_frame")
	var tree = get_tree()
	if tree.has_group("LevelNavGroup"):
		levelNavigation = tree.get_nodes_in_group("LevelNavGroup")[0]
	if tree.has_group("Player"):
		player = tree.get_nodes_in_group("Player")[0]

func navigate():
	if path.size() > 0:
		velocity = global_position.direction_to(path[1]) * SPEED
	
	if global_position == path[0]:
		path.pop_front()

func generate_path():
	if levelNavigation != null && player != null:
		path = levelNavigation.get_simple_path(global_position, player.global_position, false)
		line2d.points = path

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
	line2d.global_position = Vector2.ZERO
	if player and levelNavigation:
		generate_path()
		navigate()
	velocity = move_and_slide(velocity)
