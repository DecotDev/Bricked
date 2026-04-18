extends CharacterBody2D

const SPEED = 300.0
var fall_speed: int = 180
var touched_a_block: bool = false
var locked_x: float

func _ready() -> void:
	locked_x = position.x

func _physics_process(delta: float) -> void:
	#check_floor4()
	#move_and_slide()

	if not $RayCast2D.is_colliding():
		velocity = Vector2(0, fall_speed)
	else:
		velocity = Vector2.ZERO
		place_block()

	move_and_slide()
	
func check_floor4():
	if is_on_floor():
		print(str(self.name) + " tocó suelo") 
		velocity = Vector2.ZERO
		#$Area2D.set_deferred("disabled", true)
		$Area2D.monitoring = false
		set_physics_process(false)
	else:
		velocity = Vector2(0,fall_speed)
		

func place_block():
	print("PLACED")
	velocity = Vector2.ZERO
	
	# 🔥 CAMBIO DE CAPA
	set_collision_layer_value(3, false) # deja de ser falling
	set_collision_layer_value(2, true)  # ahora es placed
	
	$Area2D.monitoring = false
	
	set_physics_process(false)

#func _on_area_2d_body_entered(body: Node2D) -> void:
	#print(str(name) + (" ha detectado a: ") + str(body.name))
	#if body.name == "Player":
		#pass
	#else:
		#touched_a_block = true
