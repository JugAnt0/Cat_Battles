extends Camera2D
@onready var anim: AnimationPlayer = $AnimationPlayer



func _ready():
	anim.play("intro_zoom")
