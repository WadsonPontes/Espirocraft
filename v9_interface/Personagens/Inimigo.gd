extends "res://Personagens/Personagem.gd"

# Guarda um referência ao objeto Jogador
onready var jogador = get_node("/root").find_node("Jogador", true, false)

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


func _on_AreaAtaque_body_entered(body):
	if body.collision_layer == 1:
		set_physics_process(false)
		jogador = body
		$AnimationPlayer.play("ataque" + anim_direcao)
	pass

func atacar():
	jogador.recebeu_ataque(dano, anim_direcao)
	$Timer.start(1)
	pass

func apos_ataque():
	estado = 'perseguicao'
	$NavigationAgent2D.set_target_location(jogador.position)
	set_physics_process(false)
	$Timer.start(1)
	pass
