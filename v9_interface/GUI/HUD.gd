extends CanvasLayer

func atualizar_vida(valor):
	$Control/ProgressBar.value = valor
	$Control/TextureProgress.value = valor
	pass
