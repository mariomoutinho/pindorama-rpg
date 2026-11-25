extends Node2D
## Reserva visual para exploração futura; sem movimentação ou conteúdo definitivo.

const MAIN_SCENE: String = "res://scenes/main.tscn"


func _ready() -> void:
	%BackButton.grab_focus()


func _on_back_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(MAIN_SCENE)
	if error != OK:
		push_error("Não foi possível voltar ao menu: %s" % error_string(error))
