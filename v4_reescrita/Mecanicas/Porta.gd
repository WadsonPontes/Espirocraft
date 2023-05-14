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
	if Input.is_action_just_pressed("interagir") and pode_usar:
		print("pode interagir")
		if $Corpo.rotation_degrees == 0:
			$Corpo/AnimationPlayer.play("para_baixo")
			print("para_baixo")
		elif $Corpo.rotation_degrees > 80 and $Corpo.rotation_degrees < 100:
			$Corpo/AnimationPlayer.play("para_direita")
			print("para_direita")
		elif $Corpo.rotation_degrees > 170 and $Corpo.rotation_degrees < 190:
			$Corpo/AnimationPlayer.play("para_cima")
			print("para_cima")
		elif $Corpo.rotation_degrees > 260 and $Corpo.rotation_degrees < 280:
			$Corpo/AnimationPlayer.play("para_esquerda")
			print("para_esquerda")
		$Luz.enabled = true
