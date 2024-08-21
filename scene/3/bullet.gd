class_name Bullet extends CharacterBody2D


var speed: int = 100


func _physics_process(delta: float) -> void:
	velocity = transform.x * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		collider.hit(self)
		#if collider.has_method("hit"):
		#	collider.hit
	#position += transform.x * speed * delta
	
func _on_kill_timer_timeout() -> void:
	queue_free()
