extends Node

var rng: = RandomNumberGenerator.new()

@onready
var brick: PackedScene = preload("res://bricks/brick4/brick_4.tscn")

var point_a: Vector2
var point_b: Vector2
var spawn_room: int = 0
var spawn_quantity: int = 0
var brick_size: int = 60
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(1.2, false).timeout
	point_a = %PointA.position
	point_b = %PointB.position
	spawn_room = point_b.x - point_a.x
	spawn_quantity = spawn_room / brick_size
	print("spawn quant: " + str(spawn_quantity))
	$BrickSpawnTimer.start()

func spawn_brick():
	var brick_node: Node = brick.instantiate()
	#var spawn_position: Vector2 = %Spawns.get_child().position
	var spawn_position: Vector2 = Vector2(point_a.x + (rng.randi_range(0, spawn_quantity) * brick_size), point_a.y)
	brick_node.position = spawn_position
	%Bricks.add_child(brick_node)


func _on_timer_timeout() -> void:
	spawn_brick()
