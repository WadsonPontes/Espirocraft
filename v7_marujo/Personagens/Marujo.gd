extends "res://Personagens/Inimigo.gd"

func _ready():
	randomize()
	locais = $Locais.get_children()
	escolher_destino()
	pass

func escolher_destino():
	if locais.size() > 0:
		if estado == 'patrulha':
			destino = locais[randi() % locais.size()]
		elif estado == 'perseguicao':
			destino = get_node("/root").find_node("Jogador", true, false)
		
		$NavigationAgent2D.set_target_location(destino.position)
	pass

func definir_movimento():
	if $NavigationAgent2D.is_navigation_finished() and estado == 'patrulha':
		if $Timer.is_stopped():
			$Timer.start()
			set_physics_process(false)
	else:
		caminhar()
	pass

func caminhar():
	var alvo = $NavigationAgent2D.get_next_location()
	
	direcao = position.direction_to(alvo)
	
	definir_direcao()
	
	if is_on_wall():
		escolher_destino()
	pass

func _on_Timer_timeout():
	escolher_destino()
	set_physics_process(true)
	pass
