extends Node2D
@onready var panda: CharacterBody2D = $Panda
@onready var timer: Timer = $Timer
@onready var death_timer: Timer = $kill_zone/Death_Timer
@onready var camera: Camera2D = $Panda/Camera

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


func _on_flag_body_entered(body: Node2D) -> void:
	if body == panda:
		unlock_next_level()
		player.play("zoom_out")
		timer.start()



func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")


func _on_kill_zone_body_entered(body: Node2D) -> void:
	if body == panda:
		player.play("zoom_out")
		death_timer.start()
		body.get_node("CollisionShape2D").queue_free()


func _on_death_timer_timeout() -> void:
	get_tree().reload_current_scene()
