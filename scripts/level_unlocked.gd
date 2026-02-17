extends Node


var unlocked_level:int = 1
const SAVE_PATH = "user://progress.save"

func save():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(unlocked_level)

func load_progress():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		unlocked_level = file.get_var()
