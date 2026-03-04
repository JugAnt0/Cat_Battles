extends CharacterBody2D
@onready var panda: CharacterBody2D = $"."

@onready var pandolfi: AnimatedSprite2D = $pandolfi
@onready var bellisto: AnimatedSprite2D = $bellisto
@onready var floris: AnimatedSprite2D = $floris
@onready var shanis: AnimatedSprite2D = $shanis


const SPEED = 225.0
const JUMP_VELOCITY = -300.0

func _ready() -> void:
	if Skins.panda == true:
		pandolfi.show()
		bellisto.hide()
		floris.hide()
		shanis.hide()
	if Skins.bellist == true:
		pandolfi.hide()
		bellisto.show()
		floris.hide()
		shanis.hide()
	if Skins.flora == true:
		pandolfi.hide()
		bellisto.hide()
		floris.show()
		shanis.hide()
	if Skins.shany == true:
		pandolfi.hide()
		bellisto.hide()
		floris.hide()
		shanis.show()
	
	
	
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var direction := Input.get_axis("move_left", "move_right")
	
	
	if direction > 0:
		pandolfi.flip_h = false
		bellisto.flip_h = false
		floris.flip_h = false
		shanis.flip_h = false
		
	elif direction < 0:
		pandolfi.flip_h = true
		bellisto.flip_h = true
		floris.flip_h = true
		shanis.flip_h = true
	if is_on_floor():
		if direction == 0:
			pandolfi.play("sit")
			bellisto.play("sit")
			floris.play("sit")
			shanis.play("sit")
		else:
			pandolfi.play("run")
			bellisto.play("run")
			floris.play("run")
			shanis.play("run")
	elif is_on_floor() == false:
		pandolfi.play("jump")
		bellisto.play("jump")
		floris.play("jump")
		shanis.play("jump")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
