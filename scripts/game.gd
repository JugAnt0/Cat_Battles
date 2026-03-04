extends Node2D
@onready var camera_2d: Camera2D = $Panda/Camera2D
@onready var back: Parallax2D = $Parallax/back
@onready var mid: Parallax2D = $Parallax/mid
@onready var front: Parallax2D = $Parallax/FRONT
@onready var player: AnimationPlayer = $Panda/Camera2D/AnimationPlayer
@onready var timer: Timer = $Timer
@onready var panda: CharacterBody2D = $Panda
@onready var level_selection: TextureButton = $Buttons/red_house/level_selection
@export var red_normal = preload("uid://daqin0thnm776")
@export var red_hover = preload("uid://djhbbe42xxupi")
@onready var t1: TileMapLayer = $TileMapLayer3
@onready var t2: TileMapLayer = $TileMapLayer
@onready var t3: TileMapLayer = $TileMapLayer5
@onready var t4: TileMapLayer = $TileMapLayer4
@onready var snows: Node2D = $snows
@export var yellow_normal = preload("uid://cywht24jm8ch8")
@export var yellow_hover = preload("uid://deo51yvhxknkh")
@onready var skin_selection: TextureButton = $Buttons/yellow_house/skin_selection


var bt = ""
var player_inside_red := false
var player_inside_yellow := false

func _ready() -> void:
	player.play("zoom_in")
	Ui.l.hide()
	if Progress.level5completed == true:
		t1.show()
		t2.show()
		t3.hide()
		t4.hide()
		snows.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_inside_red and Input.is_action_just_pressed("jump"):
		_on_level_selection_pressed()
	if player_inside_yellow and Input.is_action_just_pressed("jump"):
		_on_skin_selection_pressed()

func _on_level_selection_pressed() -> void:
	bt = "level_selector"
	player.play("zoom_out")
	timer.start()

func _on_skin_selection_pressed() -> void:
	bt = "skin_selector"
	player.play("zoom_out")
	timer.start()


func _on_timer_timeout() -> void:
	if bt == "level_selector":
		get_tree().change_scene_to_file("res://scenes/level_selection.tscn")
	if bt == "skin_selector":
		get_tree().change_scene_to_file("res://scenes/skin_selector.tscn")
		
func _on_red_house_body_entered(body: Node2D) -> void:
	if body == panda:
		player_inside_red = true
		level_selection.texture_normal = red_hover

func _on_red_house_body_exited(body: Node2D) -> void:
	if body == panda:
		player_inside_red = false
		level_selection.texture_normal = red_normal


func _on_yellow_house_body_entered(body: Node2D) -> void:
	if body == panda:
		player_inside_yellow = true
		skin_selection.texture_normal = yellow_hover


func _on_yellow_house_body_exited(body: Node2D) -> void:
	if body == panda:
		player_inside_yellow = false
		skin_selection.texture_normal = yellow_normal
