extends KinematicBody2D

export var velocidade : int
export var max_vida: int
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

func recebeu_ataque(dano_sofrido, anim_dir):
	vida -= dano_sofrido
	
	if vida <= 0:
		$AnimationPlayer.play("morrer")
		set_physics_process(false)
	
	empurrar(anim_dir)
	apos_ataque()
	pass

func empurrar(anim_dir):
	if anim_dir == "_cima":
		position.y -= empurrao
	elif anim_dir == "_baixo":
		position.y += empurrao
	elif anim_dir == "_direita":
		position.x += empurrao
	else:
		position.x -= empurrao
	pass

func apos_ataque():
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
