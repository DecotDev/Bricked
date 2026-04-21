extends CharacterBody2D

var fall_speed: int = 180
var touched_a_block: bool = false
var locked_x: float

func _ready() -> void:
	locked_x = position.x

func _physics_process(delta: float) -> void:

	if not $RayCast2D.is_colliding():
		velocity = Vector2(0, fall_speed)
	else:
		velocity = Vector2.ZERO
		place_block()

	move_and_slide()

func place_block():
	print("PLACED")
	velocity = Vector2.ZERO
	
	# CAMBIO DE CAPA
	set_collision_layer_value(3, false) # deja de ser falling
	set_collision_layer_value(2, true)  # ahora es placed

	set_physics_process(false)
