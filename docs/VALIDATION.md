# Validação da fundação — Pindorama RPG

ID: pindorama.validation-foundation | Data: 2026-11-25 | Escopo: fase 1.

## Ambiente e inspeção

O workspace inicialmente aberto era `E:\ta-pago`, de outro produto. O responsável orientou usar o disco E:; o projeto Godot existente foi localizado em `E:\pindorama` e utilizado. Nenhum arquivo do Tá Pago foi alterado.

O projeto continha `project.godot`, ícone e importação, `.editorconfig`, `.gitattributes`, `.gitignore` e cache `.godot/`. Não havia Git inicializado, cenas, scripts ou documentação. Os arquivos originais versionáveis foram registrados no commit local `9119adc` antes da implementação. Nenhum remoto foi configurado.

Executável utilizado:

`E:\Godot_v4.7.2-stable_win64.exe\Godot_v4.7.2-stable_win64_console.exe`

Versão reportada: `4.7.2.stable.official.ed1daf0bf`.

## Resultados executados

| Verificação | Resultado observado |
| --- | --- |
| `--version` | Versão 4.7.2 confirmada; saída 0 |
| `--headless --path E:\pindorama --editor --import` | Importação e registro de scripts sem erros reportados; saída 0 |
| `--headless --path E:\pindorama --quit-after 5` | Cena principal iniciada sem erros reportados; saída 0 |
| `--headless --path E:\pindorama --script res://tests/test_foundation.gd` | 49 verificações aprovadas; Sair encerrou o processo com saída 0 |
| Renderização local em instância oculta, resolução 1280 × 720 | Menu e reserva renderizados; saída 0; renderizador efetivo `gl_compatibility` |
| Inspeção visual das duas imagens | Textos legíveis, interface centralizada, botões sem cortes e foco visível |
| `git diff --check` | Sem erros de espaços em branco |
| `git check-ignore` sobre cache, exportações, credenciais e override | Exclusões correspondentes confirmadas |

As 49 verificações cobrem 17 configurações carregadas, os 18 diretórios requeridos e 14 verificações de carregamento/interface/foco/navegação. O teste aciona os sinais dos botões nas cenas reais e termina por Sair; um temporizador produziria falha se o encerramento não ocorresse.

A prévia gráfica usou OpenGL 3.3 na NVIDIA GeForce GTX 1050. Capturas do viewport base (640 × 360) foram salvas em `.godot/main-preview.png` e `.godot/exploration-preview.png`; logs e script auxiliar também ficaram no cache ignorado, sem entrar no commit. A captura comprova composição visual nesta máquina, sem substituir testes em dispositivos-alvo.

## Arquivos e decisões

Modificados: `project.godot` e `.gitignore`. Preservados: nome interno Pindorama, ícone/importação original, física Jolt, `.editorconfig` e `.gitattributes`.

Criados: `README.md`, `AGENTS.md`, `docs/GDD.md`, `docs/ARCHITECTURE.md`, `docs/ROADMAP.md`, `docs/CULTURAL_RESEARCH.md`, este relatório, menu e script em `scenes/`, reserva e script em `world/`, suíte em `tests/`, três metadados `.gd.uid` gerados pela Godot e 14 `.gitkeep`.

As configurações e justificativas estão na [arquitetura](ARCHITECTURE.md). Os scripts são locais às cenas, com sinais e GDScript tipado; sem autoloads ou dependências de teste. A interface é provisória e neutra. A pesquisa cultural específica e a licença continuam pendentes, sem fatos ou costumes inventados.

## Limites e continuidade

Nenhum erro foi observado nas validações executadas. Não houve teste de exportação, outras GPUs/plataformas, mouse/teclado físicos ou redimensionamento manual. Não há mapa jogável, movimento, combate, narrativa definitiva ou personagens finais.

Próximos passos propostos: revisar a fundação com o responsável, decidir plataformas/controles e autorizar separadamente o protótipo de exploração e o recorte de pesquisa cultural. Nenhuma fase seguinte foi iniciada. Esta entrega é local e não autoriza publicação remota.

## Publicação autorizada posteriormente — 2026-11-25

Após a conclusão da fundação local, o responsável autorizou expressamente criar um repositório público no GitHub e enviar a branch `main`. Foi criado [mariomoutinho/pindorama-rpg](https://github.com/mariomoutinho/pindorama-rpg), mantendo o histórico local e sem avançar a fase de desenvolvimento. As referências anteriores a entrega local registram o escopo da autorização inicial.

Antes do envio, o estado Git estava limpo. Os arquivos versionados foram conferidos; cache, logs, exportações e credenciais não integram o histórico. A verificação de padrões de chaves privadas e tokens não encontrou ocorrências. Nenhuma configuração ou lógica do jogo foi alterada nesta publicação.
