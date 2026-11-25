# Orientações para agentes — Pindorama RPG

ID: pindorama.agents | Revisão: 2026-11-25 | Escopo: esta pasta e descendentes.

## Antes de editar

- Leia README, GDD, arquitetura, roadmap e os arquivos afetados. Identifique raiz Git, branch, remotos e alterações locais. Preserve o trabalho existente.
- Use Godot 4.7.2 e GDScript tipado. Consulte a documentação oficial 4.7 antes de alterar APIs ou configurações. Separe comportamento observado de funcionalidade planejada.
- Trabalhe somente na fase autorizada. A fundação não autoriza combate, narrativa definitiva, personagens finais nem o início da próxima fase.

## Arquitetura e código

- Respeite as responsabilidades de [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md). Prefira composição de cenas pequenas, sinais e dependências explícitas.
- Mantenha scripts próximos das cenas; use snake_case para arquivos, funções e variáveis e PascalCase para classes/nós. Nomeie o código em inglês e textos/documentação em pt-BR.
- Sistemas de domínio pertencem a `systems/`; conteúdo declarativo a `resources/` e `narrative/`; arte e áudio a `assets/`. Não introduza regras de batalha ou missões em scripts de interface.
- Não crie autoloads, frameworks, plugins ou serviços sem necessidade demonstrada. A fundação não usa singletons.
- Preserve 640 × 360, escala inteira, Nearest e Compatibility, salvo pedido explícito. Não substituir recursos originais sem necessidade.

## Testes e entrega

- Escreva ou atualize testes significativos para comportamento novo e correções em `tests/`. Não usar somente inspeção textual para afirmar comportamento em execução.
- Execute importação headless, execução breve e `tests/test_foundation.gd` conforme README. Para alterações visuais, revise também a interface renderizada quando possível. Registre comandos, códigos de saída, falhas e limitações; não invente sucesso.
- Revise diff e segredos. Versione `.uid` e `.import`; exclua cache, exportações, temporários e credenciais. Adicione somente arquivos da tarefa.
- Não publicar, criar remoto, fazer push ou deploy sem autorização explícita. Não reescrever histórico nem descartar alterações. Pare no final da fase autorizada e reporte pendências.

## Identidade cultural

- Leia [docs/CULTURAL_RESEARCH.md](docs/CULTURAL_RESEARCH.md) antes de propor nomes, falas, imagens, costumes ou conhecimentos culturais.
- Não invente informações históricas, crenças ou costumes; não trate povos distintos como uma cultura única nem apresente ficção como fato.
- Registre fontes, povo/comunidade, contexto, autoria e permissões; mantenha incertezas explícitas. Consulta cultural, consentimento e revisão com participantes indígenas devem orientar conteúdo futuro.
- Não reutilize materiais restritos, sagrados, privados ou sem autorização. Não introduza estereótipos ou símbolos genéricos como substitutos de pesquisa. Use reservas visuais neutras até decisões específicas.
