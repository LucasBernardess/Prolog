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
