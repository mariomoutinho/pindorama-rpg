# Arquitetura — Pindorama RPG

ID: pindorama.architecture | Revisão: 2026-11-25 | Estado: fundação implementada e limites futuros.

## Tecnologias e apresentação

Godot 4.7.2, GDScript tipado e renderizador Compatibility. Renderização em viewport 640 × 360, janela inicial 1280 × 720, aspecto keep, escala integer/1.0 e filtro Nearest. Janela mínima de 640 × 360 para evitar recorte abaixo da base.

O projeto original já definia resoluções, viewport, integer e Nearest. Foram explicitados keep e escala 1.0; Forward Plus foi substituído por GL Compatibility, com override móvel consistente, e a seleção Direct3D 12 foi removida por não corresponder ao renderizador solicitado. O nome interno Pindorama, ícone, física Jolt, `.editorconfig` e `.gitattributes` foram preservados. A física 3D não é utilizada nesta fase. GDScript é a linguagem dos scripts `.gd`; não há configuração de linguagem global nem dependência de .NET necessária.

Referência técnica: [ProjectSettings da Godot 4.7](https://docs.godotengine.org/en/4.7/classes/class_projectsettings.html).

## Módulos

| Diretório | Responsabilidade |
| --- | --- |
| `assets/sprites` | Sprites; sem arte final nesta fase |
| `assets/tilesets` | Texturas de tilesets; recursos TileSet em `resources/` |
| `assets/audio/music` | Músicas |
| `assets/audio/sfx` | Efeitos sonoros |
| `assets/fonts` | Fontes licenciadas |
| `scenes` | Cenas de entrada/interface e scripts associados |
| `characters` | Cenas e comportamentos de personagens futuros |
| `world` | Cenas de exploração/mapas e scripts locais |
| `systems/battle` | Futuras regras de combate em turnos |
| `systems/dialogue` | Futuro processamento de diálogos/ramificações |
| `systems/inventory` | Futuras regras de itens e inventário |
| `systems/quests` | Futuro estado de missões |
| `systems/progression` | Futura progressão de personagens |
| `resources` | Futuros Resources/tipos de dados declarativos |
| `narrative` | Futuro conteúdo narrativo revisado |
| `autoload` | Serviços globais somente quando justificados; vazio |
| `tests` | Testes GDScript headless sem plugin |
| `docs` | Decisões, escopo, pesquisa e validação |

Diretórios vazios possuem `.gitkeep`. Não há módulos de domínio implementados. A localização de relações comunitárias, conhecimentos e persistência será decidida quando seus contratos forem autorizados.

## Fluxo implementado

`project.godot` → `scenes/main.tscn` → Iniciar → `world/exploration.tscn` → Voltar ao menu → `scenes/main.tscn`.

As duas cenas têm raiz Node2D e interface em CanvasLayer com Controls ancorados/containers. Sinais `pressed` conectados na cena acionam scripts locais. Iniciar recebe foco ao abrir o menu; Voltar recebe foco ao abrir a reserva. Sair chama `SceneTree.quit()`. Erros de troca de cena são reportados. Não há jogador, câmera de exploração, estado persistente ou autoload.

## Evolução modular

Preferir composição, sinais e interfaces pequenas. Interface apresenta e solicita ações; sistemas futuros concentram regras; Resources descrevem dados; narrativa mantém conteúdo separado do processamento. Introduzir abstrações apenas com casos concretos e testes. Não acoplar futuros sistemas de domínio aos nós do menu.

## Validação

`tests/test_foundation.gd` testa os ProjectSettings carregados, estrutura de diretórios, carregamento da cena, textos, foco, troca real de cenas e Sair. Os comandos estão no [README](../README.md). Headless não comprova qualidade visual, filtragem efetiva de arte futura ou compatibilidade gráfica de dispositivos-alvo.
