extends CharacterBody2D

const SPEED = 300.0
var fall_speed: int = 180
var touched_a_block: bool = false
var locked_x: float

func _ready() -> void:
	locked_x = position.x

func _physics_process(delta: float) -> void:
	check_floor4()
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

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(str(name) + (" ha detectado a: ") + str(body.name))
	#if body.is_class("Block") or body.name == "StaticBody2D" :
	if body.name == "Player":
		pass
	else:
		touched_a_block = true
