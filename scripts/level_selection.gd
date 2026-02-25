# LevelSelection.gd (root Node2D of level select scene)
extends Node2D
@onready var lock2: Node2D = $levels/TextureButton2/lock
@onready var locked_level_2: Sprite2D = $levels/TextureButton2/LockedLevel2
@onready var locked_level_3: Sprite2D = $levels/TextureButton3/LockedLevel3
@onready var lock3: Node2D = $levels/TextureButton3/lock
@onready var lock4: Node2D = $levels/TextureButton4/lock
@onready var locked_level_4: Sprite2D = $levels/TextureButton4/LockedLevel4
@onready var timer: Timer = $Timer

var bt = ""
@onready var player: AnimationPlayer = $Camera2D/AnimationPlayer
@onready var lock2_anim: AnimationPlayer = $levels/TextureButton2/lock/Sprite2D/AnimationPlayer
@onready var lock3_anim: AnimationPlayer = $levels/TextureButton3/lock/Sprite2D/AnimationPlayer
@onready var lock4_anim: AnimationPlayer = $levels/TextureButton4/lock/Sprite2D/AnimationPlayer

func _ready() -> void:
	Ui.l.hide()
	player.play("zoom_in")
	if Progress.level1completed ==true:
		lock2.visible = false
		locked_level_2.visible=false
	if Progress.level1completed ==false:
		lock2.visible = true
		locked_level_2.visible= true
	if Progress.level2completed ==true:
		lock3.visible = false
		locked_level_3.visible=false
	if Progress.level2completed ==false:
		lock3.visible = true
		locked_level_3.visible= true
	if Progress.level3completed ==false:
		lock4.visible = true
		locked_level_4.visible= true
	if Progress.level3completed ==true:
		lock4.visible = false
		locked_level_4.visible= false
		
		
func _on_texture_button_pressed() -> void:
	
	bt = "1"
	timer.start()
	player.play("zoom out")

func _on_texture_button_2_pressed() -> void:
	
	if Progress.level1completed == false:
		lock2_anim.play("locked")
	if Progress.level1completed == true:
		bt = "2"
		timer.start()
		player.play("zoom out")
		
	

func _on_texture_button_3_pressed() -> void:
	if Progress.level2completed == false:
		lock3_anim.play("locked")
	if Progress.level2completed == true:
		bt = "3"
		timer.start()
		player.play("zoom out")
		


func _on_texture_button_4_pressed() -> void:
	if Progress.level3completed == false:
		lock4_anim.play("locked")
	if Progress.level3completed == true:
		bt = "4"
		player.play("zoom out")
		timer.start()
		


func _on_timer_timeout() -> void:
	Ui.l.show()
	if bt == "1":
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	elif bt == "2":
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	elif bt == "3":
		get_tree().change_scene_to_file("res://scenes/level_3.tscn")
	elif bt == "4":
		get_tree().change_scene_to_file("res://scenes/level_4.tscn")
