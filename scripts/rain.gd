extends Area2D
@onready var panda: CharacterBody2D = %Panda
@onready var camera: Camera2D = %Camera
@onready var anim_timer: Timer = $AnimTimer
var speed := 100.0
@onready var rain: Area2D = $"."
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var col: CollisionShape2D = $CollisionShape2D
@onready var death_timer: Timer = %Death_Timer
@onready var player: AnimationPlayer = $"../../Panda/Camera/AnimationPlayer"

var velocity = Vector2.ZERO

func _ready() -> void:
	anim.play("falling")
	

func _physics_process(delta: float) -> void:
	position.y += speed * delta



func _on_body_entered(body):
	if body==panda:
		player.play("zoom_out")
		death_timer.start()
	anim.play("fell")
	anim_timer.start()
	
	set_physics_process(false)
	speed = 0

	
	

	
	
	

func _on_anim_timer_timeout() -> void:
	queue_free()
