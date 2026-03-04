# LevelSelection.gd (root Node2D of level select scene)
extends Node2D
@onready var lock2: Node2D = $levels/TextureButton2/lock
@onready var locked_level_2: Sprite2D = $levels/TextureButton2/LockedLevel2
@onready var locked_level_3: Sprite2D = $levels/TextureButton3/LockedLevel3
@onready var lock3: Node2D = $levels/TextureButton3/lock
@onready var lock4: Node2D = $levels/TextureButton4/lock
@onready var locked_level_4: Sprite2D = $levels/TextureButton4/LockedLevel4
@onready var timer: Timer = $Timer
@onready var locked_level_5: Sprite2D = $levels/TextureButton5/LockedLevel5
@onready var lock5: Node2D = $levels/TextureButton5/lock
@onready var locked_level_6: Sprite2D = $levels/TextureButton6/LockedLevel6
@onready var lock6: Node2D = $levels/TextureButton6/lock
@onready var lock6_anim: AnimationPlayer = $levels/TextureButton6/lock/Sprite2D/AnimationPlayer
@onready var locked_level_7: Sprite2D = $levels/TextureButton7/LockedLevel7
@onready var lock7: Node2D = $levels/TextureButton7/lock
@onready var lock7_anim: AnimationPlayer = $levels/TextureButton7/lock/Sprite2D/AnimationPlayer
@onready var locked_level_8: Sprite2D = $levels/TextureButton8/LockedLevel8
@onready var lock8: Node2D = $levels/TextureButton8/lock
@onready var lock8_anim: AnimationPlayer = $levels/TextureButton8/lock/Sprite2D/AnimationPlayer
@onready var locked_level_9: Sprite2D = $levels/TextureButton9/LockedLevel9
@onready var lock9: Node2D = $levels/TextureButton9/lock
@onready var lock9_anim: AnimationPlayer = $levels/TextureButton9/lock/Sprite2D/AnimationPlayer


var bt = ""
@onready var player: AnimationPlayer = $Camera2D/AnimationPlayer
@onready var lock2_anim: AnimationPlayer = $levels/TextureButton2/lock/Sprite2D/AnimationPlayer
@onready var lock3_anim: AnimationPlayer = $levels/TextureButton3/lock/Sprite2D/AnimationPlayer
@onready var lock4_anim: AnimationPlayer = $levels/TextureButton4/lock/Sprite2D/AnimationPlayer
@onready var lock5_anim: AnimationPlayer = $levels/TextureButton5/lock/Sprite2D/AnimationPlayer
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
	if Progress.level4completed ==false:
		lock5.visible = true
		locked_level_5.visible= true
	if Progress.level4completed ==true:
		lock5.visible = false
		locked_level_5.visible= false
	if Progress.level5completed ==false:
		lock6.visible = true
		locked_level_6.visible= true
	if Progress.level5completed ==true:
		lock6.visible = false
		locked_level_6.visible= false
	if Progress.level6completed ==false:
		lock7.visible = true
		locked_level_7.visible= true
	if Progress.level6completed ==true:
		lock7.visible = false
		locked_level_7.visible= false
	if Progress.level7completed ==false:
		lock8.visible = true
		locked_level_8.visible= true
	if Progress.level7completed ==true:
		lock8.visible = false
		locked_level_8.visible= false
	if Progress.level8completed ==false:
		lock9.visible = true
		locked_level_9.visible= true
	if Progress.level8completed ==true:
		lock9.visible = false
		locked_level_9.visible= false
		
		
		
		
		
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
	elif bt == "5":
		get_tree().change_scene_to_file("res://scenes/level_5.tscn")
	elif bt == "6":
		get_tree().change_scene_to_file("res://scenes/level_6.tscn")
	elif bt == "7":
		get_tree().change_scene_to_file("res://scenes/level_7.tscn")
	elif bt == "8":
		get_tree().change_scene_to_file("res://scenes/level_8.tscn")
	elif bt == "9":
		get_tree().change_scene_to_file("res://scenes/level_8.tscn")


func _on_texture_button_5_pressed() -> void:
	if Progress.level4completed == false:
		lock5_anim.play("locked")
	if Progress.level4completed == true:
		bt = "5"
		player.play("zoom out")
		timer.start()


func _on_texture_button_6_pressed() -> void:
	if Progress.level5completed == false:
		lock6_anim.play("locked")
	if Progress.level5completed == true:
		bt = "6"
		player.play("zoom out")
		timer.start()


func _on_texture_button_7_pressed() -> void:
	if Progress.level6completed == false:
		lock7_anim.play("locked")
	if Progress.level6completed == true:
		bt = "7"
		player.play("zoom out")
		timer.start()


func _on_texture_button_8_pressed() -> void:
	if Progress.level7completed == false:
		lock8_anim.play("locked")
	if Progress.level7completed == true:
		bt = "8"
		player.play("zoom out")
		timer.start()


func _on_texture_button_9_pressed() -> void:
	if Progress.level8completed == false:
		lock9_anim.play("locked")
	if Progress.level8completed == true:
		bt = "9"
		player.play("zoom out")
		timer.start()
