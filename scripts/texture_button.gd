extends TextureButton

@export var level_number:int
@export var level_scene_path:String
@onready var timer: Timer = $"../../Timer"

@onready var player: AnimationPlayer = $"../../Camera2D/AnimationPlayer"

@onready var lock_icon = $"lock"


func _ready():
	update_state()
	pressed.connect(_on_pressed)
	for button in get_tree().get_nodes_in_group("level_buttons"):
		button.update_state()


func update_state() -> void:
	if level_number > Progress.unlocked_level:
		disabled = true
		if lock_icon:
			lock_icon.visible = true
	else:
		disabled = false
		if lock_icon:
			lock_icon.visible = false


func _on_pressed() -> void:
	if level_number <= Progress.unlocked_level:
		timer.start()
		player.play("zoom out")
		

func unlock_next_level():
	if Progress.unlocked_level < level_number + 1:
		Progress.unlocked_level = level_number + 1
		Progress.save()


func _on_timer_timeout() -> void:
	
	get_tree().change_scene_to_file(level_scene_path)
