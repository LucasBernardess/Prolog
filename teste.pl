% Parte 1

% Letra A - adicionar
adicionaNoFinal(X, [], [X]). % Caso base: se a lista é vazia, L2 será [X]
adicionaNoFinal(X, [Cab|Cau], [Cab|L2]) :-
    adicionaNoFinal(X, Cau, L2). % Caso recursivo: mantém o primeiro elemento e adiciona X no final da cauda

% Letra B - remover
remover(1, [_|Cau], Cau). % Caso base: se a posição é 1, remove o primeiro elemento da lista
remover(X, [Cab|Cau], [Cab|L2]) :-
    X > 1, X1 is X - 1, remover(X1, Cau, L2). % Caso recursivo: mantém o primeiro elemento e remove da cauda

% Letra C - inverter
inverte(L1, L2) :-
    inverteLista(L1, [], L2).

inverteLista([], Acc, Acc). % Caso base: quando a lista original está vazia, a lista invertida é igual ao acumulador
inverteLista([Cab|Cal], Acc, L2) :-
    inverteLista(Cal, [Cab|Acc], L2). % Caso recursivo: inverte a cauda e adiciona a cabeça no acumulador

% Letra D - tamanho
tamanho([], 0). % Caso base: lista vazia tem tamanho 0

tamanho([_|Resto], Tamanho) :-
  tamanho(Resto, TamanhoResto), % Calcula o tamanho do restante da lista
  Tamanho is TamanhoResto + 1. % Incrementa o tamanho pelo restante da lista

% Letra E - soma
soma([], 0). % Caso base: a soma de uma lista vazia é 0
soma([Cab|Cal], X) :-
    soma(Cal, X1), X is X1 + Cab. % Caso recursivo: soma o elemento atual com a soma dos elementos restantes

% Testes e Compilações
?- adicionaNoFinal(4, [1, 2, 3], L2).
?- remover(2, [1, 2, 3, 4], L2).
?- inverte([1, 2, 3, 4], L2).
?- Tamanho([1, 2, 3, 4], Tamanho).
?- soma([1, 2, 3, 4], Soma).




% Parte 2

% Declarações das variáveis
tecnico(rogerio).
tecnico(ivone).

engenheiro(daniel).
engenheiro(isabel).
engenheiro(oscar).
engenheiro(tomas).
engenheiro(ana).

supervisor(luis).

supervisor_chefe(sonia).

secretaria_executiva(laura).

diretor(santiago).

% Definição das regras
chefe(X, Y) :- engenheiro(X), tecnico(Y).
chefe(X, Y) :- supervisor(X), engenheiro(Y).
chefe(X, Y) :- supervisor(X), tecnico(Y).
chefe(X, Y) :- supervisor_chefe(X), supervisor(Y).
chefe(diretor, Y) :- supervisor_chefe(Y).
chefe(diretor, laura).

% Letra A
% a) Quem são os chefes dos técnicos e por quem eles são chefiados?
%
% Através do comando abaixo, poderemos ver quem são os chefes dos
% técnicos
%
?- chefe(X, Y), tecnico(Y). % Doze Resultados

% Letra B
% b) Quem é o chefe da Ivone e qual é o cargo deste chefe?

?- chefe(X, ivone), engenheiro(X). % Cinco Resultados

?- chefe(X, ivone), supervisor(X). % Um Resultado

?- chefe(X, ivone), supervisor_chefe(X). % Nenhum Resultado

?- chefe(X, ivone), secretaria_executiva(X).% Nenhum Resultado

?- chefe(X, ivone), diretor(X). % Nenhum Resultado

% Letra C
% c) Quem são as pessoas chefiados pelo supervisor chefe ou pelo supervisor?

?- chefe(X, Y), supervisor_chefe(X). % Um Resultado

?- chefe(X, Y), supervisor(X). % Sete Resultados

% Letra D
% d) Sabendo que Carolina não é chefiada pelo diretor, qual é o seu cargo?

?-  chefe(santiago, Carolina).
