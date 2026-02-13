extends Node

var history: Array[String] = []

func push_scene(path: String) -> void:
	if history.is_empty() or history.back() != path:
		history.append(path)

func pop_scene() -> String:
	if history.size() > 1:
		history.pop_back()
		return history.back()
	return ""  # no previous scene
