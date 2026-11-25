extends Node2D
## Menu provisório da fundação. Não contém estado de jogo.

const EXPLORATION_SCENE: String = "res://world/exploration.tscn"


func _ready() -> void:
	%StartButton.grab_focus()


func _on_start_pressed() -> void:
	var error: Error = get_tree().change_scene_to_file(EXPLORATION_SCENE)
	if error != OK:
		push_error("Não foi possível abrir a cena provisória: %s" % error_string(error))


func _on_quit_pressed() -> void:
	get_tree().quit()
