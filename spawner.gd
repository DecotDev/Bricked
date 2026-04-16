extends Node

var rng: = RandomNumberGenerator.new()

@onready
var flying_head: PackedScene = preload("res://Enemies/FlyingHead/flying_head.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
