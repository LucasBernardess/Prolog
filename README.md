# Estrutura do Repositório - Trabalho em Prolog

Este repositório contém o código-fonte em Prolog e um trabalho em grupo desenvolvido como parte de trabalho prático da disciplina de Lógica aplicada a computação da UFSJ 2023/1.

O objetivo do trabalho é resolver questões relacionadas à manipulação de listas e à representação de uma estrutura hierárquica de uma empresa.

## Parte 1 - Manipulação de Listas

Nesta parte do trabalho, foram implementados predicados relacionados a listas na linguagem Prolog. As seguintes funções foram desenvolvidas:

- `adicionaNoFinal(X, L1, L2)`: adiciona o elemento `X` no final da lista `L1` e retorna a lista resultante em `L2`.
- `remover(X, L1, L2)`: remove o elemento na posição `X` da lista `L1` e retorna a lista resultante em `L2`.
- `inverte(L1, L2)`: inverte a ordem dos elementos da lista `L1` e retorna a lista resultante em `L2`.
- `tamanho(L1, X)`: retorna o tamanho (número de elementos) da lista `L1` no valor `X`.
- `soma(L1, X)`: calcula a soma de todos os elementos da lista `L1` e retorna o resultado em `X`.

## Parte 2 - Estrutura Hierárquica da Empresa

Nesta parte do trabalho, as informações sobre a estrutura hierárquica da empresa foram representadas por meio de um programa em Prolog. Foram definidos fatos e regras para representar as relações entre pessoas e seus cargos. As seguintes consultas foram implementadas:

- `tecnico_f(Tecnico), chefe(Chefe, Tecnico), chefe(Chefe_do_chefe, Chefe), write('\n').`: encontra os chefes dos técnicos e seus respectivos subordinados.
- `chefe(X, ivone), cargo(X, Y), write('\n').`: encontra o chefe de Ivone e retorna o cargo desse chefe.
- `chefe(X, Y), supervisor_chefe_f(X), write('\n').`: encontra as pessoas que são chefiadas pelo supervisor chefe.
- `chefe(X, Y), supervisor_f(X), write('\n').`: encontra as pessoas que são chefiadas pelo supervisor.
- `chefe(santiago, carolina); write('Erro: O diretor Santiago não chefia essa pessoa, portanto ela não trabalha na empresa.'). `: determina o cargo de Carolina, considerando que ela não é chefiada pelo diretor.

## Como Executar

1. Certifique-se de ter um interpretador ou compilador Prolog instalado em seu ambiente.
2. Clone este repositório em sua máquina local ou faça o download dos arquivos.
3. Abra o arquivo do programa Prolog em seu interpretador ou compilador.
4. Execute as consultas fornecidas para obter as respostas às perguntas propostas.

## Contribuidores

Este trabalho foi desenvolvido por um grupo composto por [Lucas Eduardo](https://github.com/LucasBernardess), [Messias Feres](https://github.com/MessiasFCM) e [Davi Greco](https://github.com/DaviGreco).

## Recursos Adicionais

- [Referência Prolog](https://exemplo.com) - Um link útil para aprender mais sobre a linguagem Prolog.
- [Documentação do Compilador/Interpretador Prolog](https://exemplo.com) - Documentação oficial do compilador ou interpretador Prolog utilizado.

Sinta-se à vontade para explorar o código-fonte e as consultas implementadas neste repositório. Se você tiver alguma dúvida ou sugestão, não hesite em entrar em contato com os membros do grupo ou abrir uma "issue" neste repositório.
