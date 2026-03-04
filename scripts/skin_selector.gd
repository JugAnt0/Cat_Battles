extends Node2D
@onready var player: AnimationPlayer = $Camera2D/AnimationPlayer
@onready var camera: Camera2D = $Camera2D
@onready var timer: Timer = $Timer
var bt = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.play("zoom_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_black_pressed() -> void:
	timer.start()
	player.play("zoom_out")
	bt = "black"


func _on_yellow_pressed() -> void:
	timer.start()
	player.play("zoom_out")
	bt = "yellow"


func _on_blackand_white_pressed() -> void:
	timer.start()
	player.play("zoom_out")
	bt = "blackandwhite"


func _on_siamese_pressed() -> void:
	timer.start()
	player.play("zoom_out")
	bt = "siamese"


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	if bt == "black":
		Skins.panda = true
		Skins.bellist = false
		Skins.flora = false
		Skins.shany = false
	if bt == "yellow":
		Skins.panda = false
		Skins.bellist = true
		Skins.flora = false
		Skins.shany = false
	if bt == "blackandwhite":
		Skins.panda = false
		Skins.bellist = false
		Skins.flora = true
		Skins.shany = false
	if bt == "siamese":
		Skins.panda = false
		Skins.bellist = false
		Skins.flora = false
		Skins.shany = true
