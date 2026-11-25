# Pindorama RPG

RPG digital 2D em Godot **4.7.2**, com GDScript, inspirado nos povos originários do Brasil. Esta entrega estabelece somente a fundação técnica. Revisão: 2026-11-25.

## Estado implementado

- Menu `scenes/main.tscn`: “Pindorama RPG”, “Protótipo de desenvolvimento”, Iniciar e Sair.
- Iniciar abre `world/exploration.tscn`, uma reserva visual sem mapa ou movimentação. Voltar ao menu restaura o foco em Iniciar. Sair encerra o processo.
- Estrutura modular, documentação e testes locais sem dependências externas.

Exploração em tempo real, visão superior, pixel art, combate em turnos, narrativa ramificada, consequências, missões, progressão, relações comunitárias, inventário e conhecimentos são diretrizes **planejadas**. Ainda não existem sistemas de jogo, personagens ou narrativa definitiva.

## Abrir e executar

Importe `project.godot` na Godot 4.7.2 e pressione F6 para a cena aberta ou F5 para o projeto. No menu, use mouse ou Tab/setas e Enter/Espaço.

Exemplo no PowerShell com o executável encontrado nesta máquina:

```powershell
$godotExe = 'E:\Godot_v4.7.2-stable_win64.exe\Godot_v4.7.2-stable_win64_console.exe'
& $godotExe --editor --path 'E:\pindorama'
```

Em outra máquina, substitua os caminhos. Não é necessário .NET, Node.js ou plugin de testes.

## Configurações

| Propriedade | Valor |
| --- | --- |
| Viewport | 640 × 360 |
| Janela inicial | 1280 × 720 |
| Janela mínima | 640 × 360 |
| Stretch / aspecto | viewport / keep |
| Escalonamento / escala | integer / 1.0 |
| Filtro de textura | Nearest |
| Renderizador | Compatibility (`gl_compatibility`) |
| Linguagem | GDScript |
| Cena principal | `res://scenes/main.tscn` |

A resolução mínima evita recorte abaixo da resolução base com escala inteira. Fonte e interface são provisórias; a direção pixel art ainda não foi produzida. Nome interno Pindorama, ícone original e configuração de física preexistente foram preservados.

## Validar

Feche o jogo antes dos testes. Importe os recursos antes de executar scripts em um clone novo:

```powershell
& $godotExe --headless --path 'E:\pindorama' --editor --import
& $godotExe --headless --path 'E:\pindorama' --quit-after 5
& $godotExe --headless --path 'E:\pindorama' --script res://tests/test_foundation.gd
```

Os comandos devem terminar com código zero e sem erros. A suíte verifica configurações, diretórios, interface, foco, navegação de ida e volta e encerramento pelo botão Sair. Headless não valida aparência, driver gráfico ou cliques físicos; faça também revisão manual no editor.

## Documentação

- [GDD](docs/GDD.md): visão, requisitos e decisões pendentes.
- [Arquitetura](docs/ARCHITECTURE.md): responsabilidades dos módulos e decisões técnicas.
- [Roadmap](docs/ROADMAP.md): limites e critérios das próximas fases.
- [Pesquisa cultural](docs/CULTURAL_RESEARCH.md): pesquisa, participação, fontes e permissões.
- [Orientações para agentes](AGENTS.md).
- [Resultados da validação desta entrega](docs/VALIDATION.md).

Repositório público: [mariomoutinho/pindorama-rpg](https://github.com/mariomoutinho/pindorama-rpg), branch principal `main`. A criação e o envio ao GitHub foram autorizados pelo responsável em 2026-11-25. Novos destinos remotos e deploys exigem autorização explícita. Os arquivos `.uid` e `.import` devem ser versionados; `.godot/` é cache regenerável. Licença do código, das artes e distribuição ainda precisam ser decididas.
