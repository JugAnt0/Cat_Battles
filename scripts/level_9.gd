extends Node2D
@onready var player: AnimationPlayer = $Panda/Camera/AnimationPlayer
@onready var panda: CharacterBody2D = $Panda
@onready var timer: Timer = $Timer
@onready var death_timer: Timer = $kill_zone/Death_Timer

func _ready() -> void:
	player.play("zoom_in")
	print("Level started")


func _on_flag_body_entered(body: Node2D) -> void:
	if body == panda:
		timer.start()
		player.play("zoom_out")
		Progress.level9completed = true
		
func _on_kill_zone_body_entered(body: Node2D) -> void:
	if body == panda:
		player.play("zoom_out")
		death_timer.start()
		

func _on_death_timer_timeout() -> void:
	get_tree().reload_current_scene()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/level_10.tscn")
