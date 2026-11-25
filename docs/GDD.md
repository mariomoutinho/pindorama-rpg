# GDD — Pindorama RPG

ID: pindorama.gdd | Revisão: 2026-11-25 | Estado: visão inicial; fundação técnica.

## Diretrizes estabelecidas

RPG digital 2D inspirado nos povos originários do Brasil, desenvolvido com Godot 4.7.2 e GDScript. Exploração em tempo real com perspectiva superior (top-down), direção artística pixel art e combate clássico em turnos. Narrativa ramificada e escolhas com consequências são objetivos do produto.

## Sistemas planejados

| Sistema | Diretriz | Estado |
| --- | --- | --- |
| Exploração | Tempo real; visão superior | Somente cena provisória; sem mapa/movimentação |
| Combate | Clássico em turnos | Não implementado; regras pendentes |
| Narrativa | Ramificações e consequências | Não implementada; conteúdo pendente |
| Missões | Sistema próprio | Não implementado; modelo pendente |
| Progressão | Evolução de personagens | Não implementada; atributos e regras pendentes |
| Comunidade | Relações comunitárias | Não implementadas; representação e regras pendentes |
| Inventário | Gerenciamento de itens | Não implementado; regras pendentes |
| Conhecimentos | Sistema de conhecimentos | Não implementado; escopo e tratamento cultural pendentes |

## Entrega desta fase

Menu com título, subtítulo, Iniciar e Sair; navegação até uma cena provisória e retorno. Nenhum personagem, conteúdo cultural específico, mapa jogável, narrativa definitiva ou combate foi criado. A interface usa recursos visuais neutros e fonte padrão temporária.

## Decisões pendentes

- Povos, comunidades, territórios, línguas e período de referência; participantes e processo de colaboração cultural.
- Premissa, protagonistas, conflitos, ramificações e consequências; separação entre ficção e referências documentadas.
- Plataforma de distribuição, dispositivos-alvo, controles e acessibilidade.
- Tamanho de tiles/sprites, paleta, fontes e direção de áudio; origem e licenciamento dos recursos.
- Composição do grupo, regras de combate, atributos, progressão e balanceamento.
- Modelos de missões, inventário, conhecimentos e relações comunitárias.
- Salvamento, localização, classificação indicativa e licença do projeto.

Não preencher essas lacunas com suposições históricas ou culturais. Consulte [pesquisa cultural](CULTURAL_RESEARCH.md) e [roadmap](ROADMAP.md).

## Fonte das decisões

Briefing do responsável nesta tarefa de fundação. A implementação observável está em `project.godot`, `scenes/main.tscn`, `scenes/main.gd`, `world/exploration.tscn` e `world/exploration.gd`; os demais itens são requisitos planejados.
