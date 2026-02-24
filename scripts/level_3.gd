extends Node2D
@onready var player: AnimationPlayer = $Panda/Camera/AnimationPlayer
@onready var panda: CharacterBody2D = $Panda
@onready var timer: Timer = $Timer



@export var level_number:int = 1


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


func _on_flag_body_entered(body: Node2D) -> void:
	if body == panda:
		unlock_next_level()
		player.play("zoom_out")
		timer.start()
