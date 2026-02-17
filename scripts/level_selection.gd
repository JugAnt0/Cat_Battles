extends Node2D
@onready var animation_player: AnimationPlayer = $Camera2D/AnimationPlayer


func _ready():
	Progress.load_progress()
	animation_player.play("zoom_in")
