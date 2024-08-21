class_name Weapon extends Node2D


@export var barrels: Node2D
@export var polygon: Polygon2D
@export var delay_timer: Timer

@onready var bullet_scene = preload("res://scene/3/bullet.tscn")


var rotate_speed = 100
var shoot_delay = 0.2
var spawn_count = 1


func _ready() -> void:
	delay_timer.wait_time = shoot_delay
	delay_timer.start()
	
func _process(delta_: float) -> void:
	var new_rotation = polygon.rotation_degrees + rotate_speed * delta_
	#barrels.rotation_degrees = fmod(new_rotation, 360)
	polygon.rotation_degrees = fmod(new_rotation, 360)
	
func _on_delay_timer_timeout() -> void:
	for bullet_spawn_marker in barrels.get_children():
		var bullet = bullet_scene.instantiate()
		get_tree().root.add_child(bullet)
		bullet.position = bullet_spawn_marker.global_position
		bullet.rotation = bullet_spawn_marker.global_rotation
