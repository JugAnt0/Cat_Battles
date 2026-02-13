extends Node2D

@onready var gui: CanvasLayer = $"/root/FishManager/GUI"
@onready var bellist := $Bellist
@onready var spawner := $Spawner
@onready var timer := $Spawner/SpawnTimer
@onready var rain_template := $Rain   
@onready var ff: Area2D = $falling_fish

func _ready() -> void:
	gui.show()
	ff.visible = false
	ff.set_physics_process(false)
	ff.set_process(false)
	rain_template.visible = false
	rain_template.set_physics_process(false)
	rain_template.set_process(false)
	timer.start()
	
	
func _on_spawn_timer_timeout() -> void:
	if rain_template == null or !is_instance_valid(rain_template):
		print("Rain template was freed! (Error)")
		return
		
	var drop = rain_template.duplicate()
	var drop_fish = ff.duplicate()
	
	drop_fish.visible = true
	drop_fish.set_process(true)
	drop_fish.set_physics_process(true)
	drop_fish.set_process_internal(true)
	
	drop.visible = true
	drop.set_physics_process(true)
	drop.set_process(true)
	
	drop_fish.position = Vector2(
		randi_range(-230, 230), 
		-150                    
	)
	add_child(drop_fish)
	drop_fish.set("velocity", Vector2(0, 100))  
	
	drop.position = Vector2(
		randi_range(-230, 230), 
		-150                    
	)
	add_child(drop)
	drop.set("velocity", Vector2(0, 100))   
	
	for child in drop_fish.get_children():
		if child is Timer:
			child.set_process_mode(Node.PROCESS_MODE_INHERIT)
