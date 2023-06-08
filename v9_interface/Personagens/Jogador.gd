extends "res://Personagens/Personagem.gd"

func _process(delta):
	atualizar_interface()
	pass

func atualizar_interface():
	get_tree().call_group("HUD", "atualizar_vida", vida)
	pass

func _input(event):
	if Input.is_action_just_pressed("ataque") and anim_tipo == "espada":
		$AnimationPlayer.play("ataque" + anim_direcao)
		set_physics_process(false)
	pass

func definir_movimento():
	direcao.x = Input.get_axis("esquerda", "direita")
	direcao.y = Input.get_axis("cima", "baixo")
	
	definir_direcao()
	pass

func morrer():
	get_tree().quit()

func _on_AreaAtaque_body_entered(body):
	if body.collision_layer == 8:
		body.recebeu_ataque(dano, anim_direcao)
	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	set_physics_process(true)
	pass
