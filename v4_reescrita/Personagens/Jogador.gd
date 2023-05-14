extends KinematicBody2D

var direcao = Vector2(0,0)
export var velocidade = 100
var frente
var dano = 0
var espada = false

func _physics_process(delta):
	definir_movimento()
	definir_animacao()
	
	move_and_slide(direcao * velocidade)
	pass

func definir_movimento():
	direcao.x = Input.get_axis("esquerda", "direita")
	direcao.y = Input.get_axis("cima", "baixo")
	
	definir_direcao()
	pass

func definir_direcao():
	if direcao.x > 0:
		frente = "_direita"
	elif direcao.x < 0:
		frente = "_esquerda"
	elif direcao.y > 0:
		frente = "_baixo"
	elif direcao.y < 0:
		frente = "_cima"
	pass

func definir_animacao():
	if direcao.x == 0 and direcao.y == 0:
		$AnimatedSprite.stop()
	else:
		if espada:
			$AnimatedSprite.play("espada" + frente)
		else:
			$AnimatedSprite.play("andar" + frente)
	pass
