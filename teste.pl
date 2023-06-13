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

% Definição dos fatos
tecnico(rogerio).
tecnico(ivone).

engenheiro(daniel).
engenheiro(isabel).
engenheiro(oscar).
engenheiro(tomas).
engenheiro(ana).

supervisor(luis).
supervisor(sonia).

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

% Testes e Compilações

% Letra A

?- chefe(X, Y), tecnico(Y).

X = daniel,
Y = rogerio ;
X = daniel,
Y = ivone ;
X = isabel,
Y = rogerio ;
X = isabel,
Y = ivone ;
X = oscar,
Y = rogerio ;
X = oscar,
Y = ivone ;
X = tomas,
Y = rogerio ;
X = tomas,
Y = ivone ;
X = ana,
Y = rogerio ;
X = ana,
Y = ivone ;
X = luis,
Y = rogerio ;
X = luis,
Y = ivone ;
X = sonia,
Y = rogerio ;
X = sonia,
Y = ivone ;
false.


% Letra B

?- chefe(X, ivone), engenheiro(X).
X = daniel ;
X = isabel ;
X = oscar ;
X = tomas ;
X = ana ;
false.

?- chefe(X, ivone), supervisor(X).

X = luis ;
X = sonia ;
false.

?- chefe(X, ivone), supervisor_chefe(X).

X = sonia ;
false.

?- chefe(X, ivone), secretaria_executiva(X).

false.

?- chefe(X, ivone), diretor(X).

false.


% Letra C
