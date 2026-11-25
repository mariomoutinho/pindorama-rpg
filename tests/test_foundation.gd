extends SceneTree
## Integração sem plugins: configurações reais, navegação e encerramento.

var failures: int = 0
var checks: int = 0


func _initialize() -> void:
	_run.call_deferred()


func _check(condition: bool, description: String) -> void:
	checks += 1
	if not condition:
		failures += 1
		push_error("FALHA: " + description)


func _run() -> void:
	var expected: Dictionary = {
		"application/config/name": "Pindorama",
		"application/run/main_scene": "res://scenes/main.tscn",
		"display/window/size/viewport_width": 640,
		"display/window/size/viewport_height": 360,
		"display/window/size/window_width_override": 1280,
		"display/window/size/window_height_override": 720,
		"display/window/size/min_width": 640,
		"display/window/size/min_height": 360,
		"display/window/stretch/mode": "viewport",
		"display/window/stretch/aspect": "keep",
		"display/window/stretch/scale_mode": "integer",
		"display/window/stretch/scale": 1.0,
		"rendering/textures/canvas_textures/default_texture_filter": 0,
		"rendering/renderer/rendering_method": "gl_compatibility",
		"rendering/renderer/rendering_method.mobile": "gl_compatibility",
		"application/config/icon": "res://icon.svg",
		"physics/3d/physics_engine": "Jolt Physics",
	}
	for key: String in expected:
		_check(ProjectSettings.get_setting(key) == expected[key], "Configuração: " + key)

	for directory: String in [
		"assets/sprites", "assets/tilesets", "assets/audio/music", "assets/audio/sfx",
		"assets/fonts", "scenes", "characters", "world", "systems/battle",
		"systems/dialogue", "systems/inventory", "systems/quests",
		"systems/progression", "resources", "narrative", "autoload", "tests", "docs",
	]:
		_check(DirAccess.dir_exists_absolute("res://" + directory), "Diretório: " + directory)

	var error: Error = change_scene_to_file("res://scenes/main.tscn")
	_check(error == OK, "Carregar menu")
	if error != OK:
		quit(1)
		return
	await scene_changed
	_check(current_scene is Node2D, "Cena inicial 2D")
	_check(current_scene.get_node("%Title").text == "Pindorama RPG", "Título")
	_check(current_scene.get_node("%Subtitle").text == "Protótipo de desenvolvimento", "Subtítulo")
	_check(current_scene.get_node("%StartButton").text == "Iniciar", "Texto Iniciar")
	_check(current_scene.get_node("%QuitButton").text == "Sair", "Texto Sair")
	_check(current_scene.get_node("%StartButton").has_focus(), "Foco inicial por teclado")

	current_scene.get_node("%StartButton").pressed.emit()
	await process_frame
	await process_frame
	_check(current_scene != null, "Transição preserva cena ativa")
	if current_scene == null:
		quit(1)
		return
	_check(current_scene.scene_file_path == "res://world/exploration.tscn", "Iniciar abre exploração")
	var back_button: Button = current_scene.get_node_or_null("%BackButton") as Button
	_check(back_button != null, "Exploração permite retorno")
	if back_button == null:
		quit(1)
		return
	_check(back_button.has_focus(), "Foco no retorno")
	back_button.pressed.emit()
	await process_frame
	await process_frame
	_check(current_scene != null, "Retorno preserva cena ativa")
	if current_scene == null:
		quit(1)
		return
	_check(current_scene.scene_file_path == "res://scenes/main.tscn", "Voltar abre menu")
	_check(current_scene.get_node("%StartButton").has_focus(), "Foco restaurado")
	if failures > 0:
		push_error("%d de %d verificações falharam." % [failures, checks])
		quit(1)
		return

	# O processo precisa terminar pelo próprio botão, com código zero.
	create_timer(2.0).timeout.connect(_on_quit_timeout)
	print("PASSOU: %d verificações. Acionando Sair; esperado: processo encerra com código 0." % checks)
	current_scene.get_node("%QuitButton").pressed.emit()


func _on_quit_timeout() -> void:
	push_error("FALHA: o botão Sair não encerrou o jogo.")
	quit(1)
