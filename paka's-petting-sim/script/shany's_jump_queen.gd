extends Node2D

@onready var gui: CanvasLayer = $"/root/FishManager/GUI"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gui.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	gui.hide()
	get_tree().change_scene_to_file("res://scenes/shanny's_minigame_selection.tscn")
