extends Node2D

@onready var timer: Timer = $Timer
var bt = ""
@onready var player: AnimationPlayer = $Camera/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.play("zoom_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_pressed() -> void:
	player.play("zoom_out")
	timer.start()
	bt = "start"

func _on_exit_pressed() -> void:
	player.play("zoom_out")
	timer.start()
	bt = "exit"
	
	
func _on_timer_timeout() -> void:
	if bt == "start":
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	if bt == "exit":
		get_tree().quit()
