extends Node2D
@onready var camera_2d: Camera2D = $Panda/Camera2D
@onready var back: Parallax2D = $Parallax/back
@onready var mid: Parallax2D = $Parallax/mid
@onready var front: Parallax2D = $Parallax/FRONT
@onready var player: AnimationPlayer = $Panda/Camera2D/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.play("zoom_in")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
