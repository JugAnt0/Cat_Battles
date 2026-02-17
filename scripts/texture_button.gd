extends TextureButton

@export var level_number:int
@export var level_scene_path:String


@onready var lock_icon = $"Lvl1/lock"


func _ready():
	update_state()
	pressed.connect(_on_pressed)


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
		get_tree().change_scene_to_file(level_scene_path)
