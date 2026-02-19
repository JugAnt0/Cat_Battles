extends Node2D

@export var level_number:int = 1
@onready var player: AnimationPlayer = $Panda/Camera/AnimationPlayer

func _ready() -> void:
	player.play("zoom_in")
	
func unlock_next_level():
	if Progress.unlocked_level < level_number + 1:
		Progress.unlocked_level = level_number + 1
		Progress.save()

func _on_level_completed():
	if Progress.unlocked_level <= level_number:
		Progress.unlocked_level = level_number + 1
		Progress.save()
