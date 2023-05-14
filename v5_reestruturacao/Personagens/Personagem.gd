extends KinematicBody2D

export var velocidade : int
export var vida : int
export var dano : int
export var empurrao : int

var direcao = Vector2(0, 0)

var anim_tipo = "andar"
var anim_direcao = "_baixo"

func _physics_process(delta):
	definir_movimento()
	definir_animacao()
	move_and_slide(direcao * velocidade)
	pass

func definir_direcao():
	if direcao.x > 0 and abs(direcao.x) > abs(direcao.y):
		anim_direcao = "_direita"
	elif direcao.x < 0 and abs(direcao.x) > abs(direcao.y):
		anim_direcao = "_esquerda"
	elif direcao.y > 0 and abs(direcao.x) < abs(direcao.y):
		anim_direcao = "_baixo"
	elif direcao.y < 0 and abs(direcao.x) < abs(direcao.y):
		anim_direcao = "_cima"
	pass

func definir_animacao():
	if (direcao.x == 0 and direcao.y == 0):
		$AnimatedSprite.stop()
	else:
		$AnimatedSprite.play(anim_tipo + anim_direcao)
	pass

func definir_movimento():
	pass
