extends Node2D

var pode_usar = false

func _on_Area2D_body_entered(body):
	if body.collision_layer == 1:
		pode_usar = true
	pass


func _on_Area2D_body_exited(body):
	if body.collision_layer == 1:
		pode_usar = false
	pass

func _input(event):
	if Input.is_action_just_pressed("usar") and pode_usar:
		mover_porta()
	pass

func mover_porta():
	if $StaticBody2D.rotation_degrees == 0:
		$StaticBody2D/AnimationPlayer.play("hor_vert")
	else:
		$StaticBody2D/AnimationPlayer.play("vert_hor")
	$Light2D.enabled = true
	pass
