extends Area2D
@onready var bellist: CharacterBody2D = $"../Bellist"

@onready var fish_timer: Timer = $FishTimer

var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += velocity * delta

func _on_body_entered(body):
	velocity = Vector2.ZERO
	fish_timer.start()
	
	if body.name == "Bellist":
		FishManager.fish += 1
		queue_free()
		return

func _on_fish_timer_timeout() -> void:
	queue_free()
