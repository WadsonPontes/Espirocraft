extends KinematicBody2D

var direcao = Vector2(0, 0)
export var velocidade = 100

func _physics_process(delta):
	atualizar_movimento()
	move_and_slide(direcao * velocidade)
	pass

func atualizar_movimento():
	direcao.x = Input.get_axis("esquerda", "direita")
	direcao.y = Input.get_axis("cima", "baixo")
	pass
