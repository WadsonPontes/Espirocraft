extends Control



func _on_Jogar_pressed():
	get_tree().change_scene("res://Niveis/Fase1.tscn")
	pass


func _on_Sair_pressed():
	get_tree().quit()
	pass
