% Integrantes :
% Davi Greco
% Lucas Eduardo Bernardes de Paula
% Messias Feres Curi Melo

% ========
% Parte 1
% ========

% =========================================================
% Letra A - Inserir elemento no fim da Lista
% =========================================================

adicionaNoFinal(X, [], [X]). % Caso base: se a lista é vazia, L2 será [X]
adicionaNoFinal(X, [Cab|Cau], [Cab|L2]) :-
    adicionaNoFinal(X, Cau, L2). % Caso recursivo: mantém o primeiro elemento e adiciona X no final da cauda


% =========================================================
% Letra B - Remover elemento da Lista
% =========================================================

remover(1, [_|Cau], Cau). % Caso base: se a posição é 1, remove o primeiro elemento da lista
remover(X, [Cab|Cau], [Cab|L2]) :-
    X > 1, X1 is X - 1, remover(X1, Cau, L2). % Caso recursivo: mantém o primeiro elemento e remove da cauda


% =========================================================
% Letra C - Inverter Lista
% =========================================================

inverte(L1, L2) :-
    inverteLista(L1, [], L2).

inverteLista([], Acc, Acc). % Caso base: quando a lista original está vazia, a lista invertida é igual ao acumulador
inverteLista([Cab|Cal], Acc, L2) :-
    inverteLista(Cal, [Cab|Acc], L2). % Caso recursivo: inverte a cauda e adiciona a cabeça no acumulador


% =========================================================
% Letra D - Tamanho da Lista
% =========================================================

tamanho([], 0). % Caso base: lista vazia tem tamanho 0

tamanho([_|Resto], Tamanho) :-
  tamanho(Resto, TamanhoResto), % Calcula o tamanho do restante da lista
  Tamanho is TamanhoResto + 1. % Incrementa o tamanho pelo restante da lista


% =========================================================
% Letra E - Retorna a soma de todos os ELEMENTOS da Lista
% =========================================================


soma([], 0). % Caso base: a soma de uma lista vazia é 0
soma([Cab|Cal], X) :-
    soma(Cal, X1), X is X1 + Cab. % Caso recursivo: soma o elemento atual com a soma dos elementos restantes


% ==================================
% Testes de Compilações da Parte 1
% ==================================

% Letra A =>>> ?- adicionaNoFinal(4, [1, 2, 3], L2).
% Letra B =>>> ?- remover(2, [1, 2, 3, 4], L2).
% Letra C =>>> ?- inverte([1, 2, 3, 4], L2).
% Letra D =>>> ?- Tamanho([1, 2, 3, 4], Tamanho).
% Letra E =>>> ?- soma([1, 2, 3, 4], Soma).

% =============
% Fim Parte 1
% =============

% ========
% Parte 2
% ========

% =========================================================
% Declaração das Proposições
% =========================================================

% Técnicos (2)
tecnico(rogerio).
tecnico(ivone).

% Engenheiros (5)
engenheiro(daniel).
engenheiro(isabel).
engenheiro(oscar).
engenheiro(tomas).
engenheiro(ana).

% Supervisor (1)
supervisor(luis).

% Supervisor Chefe (1)
supervisor_chefe(sonia).

% Secretária (1)
secretaria_executiva(laura).

% Diretor (1)
diretor(santiago).

% =========================================================
% Definição da regras
% =========================================================

% técnico < engenheiro < supervisor < supervisor_chefe < diretor
% secretária < diretor

% Os técnicos são chefiados por engenheiros.
chefe(X, Y) :- engenheiro(X), tecnico(Y).
% Os engenheiros são chefiados pelos supervisores.
chefe(X, Y) :- supervisor(X), engenheiro(Y).
% Os analistas também são chefiados pelos supervisores.
chefe(X, Y) :- supervisor(X), tecnico(Y).
% Os supervisores são chefiados pelo supervisor chefe.
chefe(X, Y) :- supervisor_chefe(X), supervisor(Y).
% O supervisor chefe é chefiado pelo diretor.
chefe(diretor, Y) :- supervisor_chefe(Y).
% A secretária executiva também é chefiada pelo diretor.
chefe(diretor, laura).

% ======================================================

% Regras não explicitas
chefe(X, Y) :- supervisor(X), tecnico(Y).

chefe(X, Y) :- supervisor_chefe(X), tecnico(Y).
chefe(X, Y) :- supervisor_chefe(X), engenheiro(Y).

chefe(diretor, Y) :- tecnico(Y).
chefe(diretor, Y) :- engenheiro(Y).
chefe(diretor, Y) :- supervisor(Y).

% ======================================================
% Letra A - Quem são os chefes dos técnicos e por 
%  quem eles são chefiados?
% ======================================================

% Chefes dos técnicos
?- chefe(X, Y), tecnico(Y).

% ======================================================
% Letra B - Quem é o chefe da Ivone e qual é o cargo 
%  deste chefe?
% ======================================================

% Verifica se tem engenheiro(cargo) chefe da Ivone e qual seu nome
?- chefe(X, ivone), engenheiro(X).

% Verifica se tem supervisor(cargo) chefe da Ivone e qual seu nome
?- chefe(X, ivone), supervisor(X). % Um Resultado

% Verifica se tem supervisor_chefe(cargo) chefe da Ivone e qual seu nome
?- chefe(X, ivone), supervisor_chefe(X). % Nenhum Resultado

% Verifica se tem secretaria_executiva(cargo) chefe da Ivone e qual seu nome
?- chefe(X, ivone), secretaria_executiva(X).% Nenhum Resultado

% Verifica se tem um diretor(cargo) chefe da Ivone e qual seu nome
?- chefe(X, ivone), diretor(X). % Nenhum Resultado

% ======================================================
% Letra C - Quem são as pessoas chefiados pelo 
%  supervisor chefe ou pelo supervisor?
% ======================================================

% Pessoas chefiadas pelo supervisor_chefe
?- chefe(X, Y), supervisor_chefe(X). 

% Pessoas chefiadas pelo supervisor
?- chefe(X, Y), supervisor(X). 

% ======================================================
% Letra D - Sabendo que Carolina não é chefiada pelo 
%  diretor, qual é o seu cargo?
% ======================================================

% Verifica se Carolina é chefiada pelo Diretor
?-  chefe(santiago, Carolina).

% Carolina não possui cargo, já que não faz parte das proposições

% =============
% Fim Parte 2
% =============

