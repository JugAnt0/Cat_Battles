extends Node


var unlocked_level:int = 1
const SAVE_PATH:String = "user://progress.save"





func save() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_var(unlocked_level)


func load_progress() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			unlocked_level = file.get_var()
			


func _ready():
	load_progress()
