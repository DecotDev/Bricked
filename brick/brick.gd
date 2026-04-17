extends CharacterBody2D

const SPEED = 300.0
var fall_speed: int = 180
var touched_a_block: bool = false


func _ready() -> void:
	pass
	
	

func _physics_process(delta: float) -> void:
	
	#check_floor()
	#check_floor2()
	#check_floor3()
	check_floor4()
	set_motion_mode(CharacterBody2D.MOTION_MODE_FLOATING)
	move_and_slide()
	
func check_floor():
	if is_on_floor():
		print("tocó suelo" + str(self.name))
		if ($Area2D.get_overlapping_bodies().size() > 0):
			print("area detectó" + str(self.name))
			velocity = Vector2.ZERO
			set_physics_process(false)
			set_collision_layer_value(2,true)
	else:
		velocity = Vector2(0,fall_speed)
		
func check_floor2():
	if is_on_floor() and ($Area2D.get_overlapping_bodies().size() > 0):
		set_collision_layer_value(2,true)
		print("area detectó" + str(self.name))
		print("tocó a : " + str($Area2D.get_overlapping_bodies()[0].name ))
		velocity = Vector2.ZERO
		set_physics_process(false)
	else:
		velocity = Vector2(0,fall_speed)

func check_floor3():
	if is_on_floor():
		print(str(self.name) + " tocó suelo") 
	if is_on_floor() and touched_a_block:
		set_collision_layer_value(2,true)
		if $Area2D.get_overlapping_bodies().size() > 0:
			print(str(self.name) + " en suelo y detectó a : " + str($Area2D.get_overlapping_bodies()[0].name ))
		velocity = Vector2.ZERO
		set_physics_process(false)
	else:
		velocity = Vector2(0,fall_speed)

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
