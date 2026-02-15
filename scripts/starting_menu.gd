extends Node2D
@onready var camera_2d: Camera2D = $Camera2D
@onready var player: AnimationPlayer = $Camera2D/AnimationPlayer
@onready var timer: Timer = $Timer


var bt = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_pressed() -> void:
	bt = "start"
	player.play("zoom_out")
	timer.start()


func _on_exit_pressed() -> void:
	bt = "exit"


func _on_timer_timeout() -> void:
	if bt == "start":
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	
	elif bt == "exit":
		get_tree().quit()
