extends "res://Personagens/Personagem.gd"

# 'patrulha' | 'perseguicao'
var estado = 'patrulha'

var locais
var destino

func definir_animacao():
	if (direcao.x == 0 and direcao.y == 0):
		$AnimationPlayer.stop()
	else:
		$AnimationPlayer.play(anim_tipo + anim_direcao)
	pass

func _on_Visao_body_entered(body):
	if body.collision_layer == 1:
		estado = 'perseguicao'
		$NavigationAgent2D.set_target_location(body.position)
		set_physics_process(true)
	pass

func _on_Visao_body_exited(body):
	if body.collision_layer == 1:
		estado = 'patrulha'
		$NavigationAgent2D.set_target_location(body.position)
	pass
