extends Node2D
@onready var camera_2d: Camera2D = $Panda/Camera2D
@onready var back: Parallax2D = $Parallax/back
@onready var mid: Parallax2D = $Parallax/mid
@onready var front: Parallax2D = $Parallax/FRONT
@onready var player: AnimationPlayer = $Panda/Camera2D/AnimationPlayer
@onready var timer: Timer = $Timer
@onready var panda: CharacterBody2D = $Panda
@onready var level_selection: TextureButton = $Buttons/red_house/level_selection
@export var house_normal = preload("uid://daqin0thnm776")
@export var house_hover = preload("uid://djhbbe42xxupi")


var bt = ""
var player_inside := false


func _ready() -> void:
	player.play("zoom_in")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("jump"):
		_on_level_selection_pressed()


func _on_level_selection_pressed() -> void:
	bt = "level_selector"
	player.play("zoom_out")
	timer.start()

func _on_skin_selection_pressed() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	if bt == "level_selector":
		get_tree().change_scene_to_file("res://scenes/level_selection.tscn")


func _on_red_house_body_entered(body: Node2D) -> void:
	if body == panda:
		player_inside = true
		level_selection.texture_normal = house_hover

func _on_red_house_body_exited(body: Node2D) -> void:
	if body == panda:
		player_inside = false
		level_selection.texture_normal = house_normal
