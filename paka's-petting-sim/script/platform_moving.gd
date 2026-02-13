extends Node2D

var speed := 70.0
var move_range := 80.0
var start_x: float

func _ready():
	start_x = global_position.x

func _physics_process(delta):
	global_position.x += speed * delta

	if abs(global_position.x - start_x) > move_range:
		speed = -speed
