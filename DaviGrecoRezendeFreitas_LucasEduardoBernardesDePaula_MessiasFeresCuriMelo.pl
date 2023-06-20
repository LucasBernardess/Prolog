/*====================================
||                                  ||
||  TRABALHO PR�TICO - PROLOG       ||
||                                  ||
||  UFSJ - Ci�ncia da Computa��o    ||
||  L�gica aplicada a Computa��o    ||
||  Professor: Edimilson Batista    ||
||                                  ||
||  INTEGRANTES DO GRUPO            ||
||  Davi Gredo Rezende Freitas      ||
||  Lucas Eduardo Bernardes de Paula||
||  Messias Feres Curi Melo         ||
||                                  ||
====================================*/

/*..........................................................................................................
............................................................................................................
....PPPPPPPPPPPPP.....AAAAAAA.......RRRRRRRRRRRRR....TTTTTTTTTTTTTTT.EEEEEEEEEEEEEEE............1111........
....PPPPPPPPPPPPPP....AAAAAAA.......RRRRRRRRRRRRRR...TTTTTTTTTTTTTTT.EEEEEEEEEEEEEEE...........11111........
....PPPPPPPPPPPPPP....AAAAAAAA......RRRRRRRRRRRRRRR..TTTTTTTTTTTTTTT.EEEEEEEEEEEEEEE.........1111111........
....PPPPP..PPPPPPPP..AAAAAAAAA......RRRRR...RRRRRRR.......TTTTT......EEEEE.................111111111........
....PPPPP....PPPPPP..AAAAAAAAA......RRRRR.....RRRRR.......TTTTT......EEEEE.................111111111........
....PPPPP.....PPPPP..AAAAAAAAAA.....RRRRR.....RRRRR.......TTTTT......EEEEE.................111111111........
....PPPPP....PPPPPP.PAAAA.AAAAA.....RRRRR...RRRRRRR.......TTTTT......EEEEE.................111111111........
....PPPPP..PPPPPPPP.PAAAA.AAAAAA....RRRRRRRRRRRRRR........TTTTT......EEEEEEEEEEEEEE............11111........
....PPPPPPPPPPPPPP.PPAAAA..AAAAA....RRRRRRRRRRRRRR........TTTTT......EEEEEEEEEEEEEE............11111........
....PPPPPPPPPPPPP..PPAAA...AAAAA....RRRRRRRRRRRR..........TTTTT......EEEEEEEEEEEEEE............11111........
....PPPPPPPPPPPP...PPAAAAAAAAAAAA...RRRRRRRRRRRR..........TTTTT......EEEEE.....................11111........
....PPPPP.........PPPAAAAAAAAAAAA...RRRRR..RRRRRR.........TTTTT......EEEEE.....................11111........
....PPPPP.........PPPAAAAAAAAAAAA...RRRRR..RRRRRRR........TTTTT......EEEEE.....................11111........
....PPPPP.........PPPAA.....AAAAAA..RRRRR...RRRRRR........TTTTT......EEEEE.....................11111........
....PPPPP........PPPPAA......AAAAA..RRRRR....RRRRRR.......TTTTT......EEEEEEEEEEEEEEE...........11111........
....PPPPP........PPPPA.......AAAAAA.RRRRR.....RRRRRR......TTTTT......EEEEEEEEEEEEEEE...........11111........
....PPPPP........PPPPA.......AAAAAA.RRRRR.....RRRRRR......TTTTT......EEEEEEEEEEEEEEE...........11111........
............................................................................................................
............................................................................................................
..........................................................................................................*/


% ======================================================================================
% Letra A - Inserir elemento no fim da Lista
% ======================================================================================

/*Para inserir um elemento no final de uma lista � necess�rio percorrer a lista at� chegar na �ltima posi��o
separando a cabe�a e a cauda recursivamente at� que a lista esteja vazia. Com a lista vazia, o proximo passo
� inserir o elemento infomado pelo usu�rio, ap�s isso a lista � chamada recursivamente novamente inserindo os
elementos anteriores um por um */

adicionaNoFinal(X, [], [X]). % Caso base: se a lista � vazia, L2 ser� [X]
adicionaNoFinal(X, [Cab|Cau], [Cab|L2]) :-
    adicionaNoFinal(X, Cau, L2). % Caso recursivo: mant�m o primeiro elemento e adiciona X no final da cauda


% ======================================================================================
% Letra B - Remover elemento da Lista
% ======================================================================================

/* Para remover um elemento de uma lista � necessario percorr�-la at� que seja encontrada a posi��o informada
pelo usu�rio, separando cabe�a e cauda da lista recursivamente. No momento que o elemento a ser removido � a
cabe�a da lista esse elemento � removido, ap�s isso o elemento que estava na cauda � substituido pelo resto da
lista original */


remover(1, [_|Cau], Cau). % Caso base: se a posi��o � 1, remove o primeiro elemento da lista
remover(X, [Cab|Cau], [Cab|L2]) :-
    X > 1, X1 is X - 1, remover(X1, Cau, L2). % Caso recursivo: mant�m o primeiro elemento e remove da cauda


% ======================================================================================
% Letra C - Inverter Lista
% ======================================================================================

/*Para inverter uma lista � necess�rio  � necess�rio inserir o elemento cabe�a de uma lista em outra recursivamente
at� que a primeira lista esteja vazia e a segunda completa.  No caso base, quando a lista est� vazia, a lista invertida
� igual ao acumulador. No caso recursivo, a cauda da lista � invertida e a cabe�a � adicionada ao acumulador. Essa
recurs�o continua at� que a lista original seja completamente percorrida, resultando na lista invertida. */

inverte(L1, L2) :-
    inverteLista(L1, [], L2).

inverteLista([], Acc, Acc). % Caso base: quando a lista original est� vazia, a lista invertida � igual ao acumulador
inverteLista([Cab|Cal], Acc, L2) :-
    inverteLista(Cal, [Cab|Acc], L2). % Caso recursivo: inverte a cauda e adiciona a cabe�a no acumulador


% ======================================================================================
% Letra D - Tamanho da Lista
% ======================================================================================

/* Para se obter o tamanho de uma lista � necess�rio contar quantas vezes � feita a chamada recursiva.
No caso base, quando a lista est� vazia, o tamanho � definido como 0. No caso recursivo, o predicado chama a si mesmo
com o restante da lista e calcula o tamanho desse restante. O tamanho final � calculado adicionando 1 ao tamanho do restante.
A recurs�o continua at� que a lista seja completamente percorrida, e o tamanho total � retornado.*/

tamanho([], 0). % Caso base: lista vazia tem tamanho 0

tamanho([_|Resto], Tamanho) :-
  tamanho(Resto, TamanhoResto), % Calcula o tamanho do restante da lista
  Tamanho is TamanhoResto + 1. % Incrementa o tamanho pelo restante da lista


% ======================================================================================
% Letra E - Retorna a soma de todos os ELEMENTOS da Lista
% ======================================================================================

/*Para se obter a soma da lista � necess�rio percorr�-la recursivamente somandos todos os elementos.
No caso base, quando a lista est� vazia, a soma � definida como 0. No caso recursivo, o predicado chama
a si mesmo com o restante da lista e calcula a soma desse restante. O valor final � obtido somando o elemento
atual com a soma dos elementos restantes. A recurs�o continua at� que a lista seja completamente percorrida,
e o valor total da soma � retornado. */

soma([], 0). % Caso base: a soma de uma lista vazia � 0
soma([Cab|Cal], X) :-
    soma(Cal, X1), X is X1 + Cab. % Caso recursivo: soma o elemento atual com a soma dos elementos restantes


% ======================================================================================
% Testes de Compila��es da Parte 1
% ======================================================================================


/*============================================================
||                   CONSULTAS PARTE 1                      ||
||                                                          ||
||   % Letra A =>>> ?- adicionaNoFinal(4, [1, 2, 3], L2).   ||
||   % Letra B =>>> ?- remover(2, [1, 2, 3, 4], L2).        ||
||   % Letra C =>>> ?- inverte([1, 2, 3, 4], L2).           ||
||   % Letra D =>>> ?- tamanho([1, 2, 3, 4], Tamanho).      ||
||   % Letra E =>>> ?- soma([1, 2, 3, 4], Soma).            ||
||                                                          ||
===========================================================*/


/*..........................................................................................................
............................................................................................................
....PPPPPPPPPPPPP.....AAAAAAA.......RRRRRRRRRRRRR....TTTTTTTTTTTTTTT.EEEEEEEEEEEEEEE..........22222222......
....PPPPPPPPPPPPPP....AAAAAAA.......RRRRRRRRRRRRRR...TTTTTTTTTTTTTTT.EEEEEEEEEEEEEEE.........2222222222.....
....PPPPPPPPPPPPPP....AAAAAAAA......RRRRRRRRRRRRRRR..TTTTTTTTTTTTTTT.EEEEEEEEEEEEEEE........222222222222....
....PPPPP..PPPPPPPP..AAAAAAAAA......RRRRR...RRRRRRR.......TTTTT......EEEEE..................222222222222....
....PPPPP....PPPPPP..AAAAAAAAA......RRRRR.....RRRRR.......TTTTT......EEEEE.................22222...22222....
....PPPPP.....PPPPP..AAAAAAAAAA.....RRRRR.....RRRRR.......TTTTT......EEEEE.................22222...22222....
....PPPPP....PPPPPP.PAAAA.AAAAA.....RRRRR...RRRRRRR.......TTTTT......EEEEE.........................22222....
....PPPPP..PPPPPPPP.PAAAA.AAAAAA....RRRRRRRRRRRRRR........TTTTT......EEEEEEEEEEEEEE...............22222.....
....PPPPPPPPPPPPPP.PPAAAA..AAAAA....RRRRRRRRRRRRRR........TTTTT......EEEEEEEEEEEEEE..............222222.....
....PPPPPPPPPPPPP..PPAAA...AAAAA....RRRRRRRRRRRR..........TTTTT......EEEEEEEEEEEEEE.............222222......
....PPPPPPPPPPPP...PPAAAAAAAAAAAA...RRRRRRRRRRRR..........TTTTT......EEEEE.....................222222.......
....PPPPP.........PPPAAAAAAAAAAAA...RRRRR..RRRRRR.........TTTTT......EEEEE....................222222........
....PPPPP.........PPPAAAAAAAAAAAA...RRRRR..RRRRRRR........TTTTT......EEEEE...................222222.........
....PPPPP.........PPPAA.....AAAAAA..RRRRR...RRRRRR........TTTTT......EEEEE..................222222..........
....PPPPP........PPPPAA......AAAAA..RRRRR....RRRRRR.......TTTTT......EEEEEEEEEEEEEEE.......2222222222222....
....PPPPP........PPPPA.......AAAAAA.RRRRR.....RRRRRR......TTTTT......EEEEEEEEEEEEEEE.......2222222222222....
....PPPPP........PPPPA.......AAAAAA.RRRRR.....RRRRRR......TTTTT......EEEEEEEEEEEEEEE.......2222222222222....
............................................................................................................
............................................................................................................
..........................................................................................................*/


% ======================================================================================
% Declara��o das Proposi��es
% ======================================================================================

% T�cnicos (2)
tecnico_f(rogerio).        % predicado que indica que Rogerio � um tecnico
cargo(rogerio, tecnico).   % predicado que indica que o cargo de Rogerio � ser tecnico
tecnico_f(ivone).          % predicado que indica que Ivone � tecnica
cargo(ivone, tecnico).     % predicado que indica que o cargo de Ivone � ser tecnica

% Engenheiros (5)
engenheiro_f(daniel).      % predicado que indica que Daniel � um engenheiro
cargo(daniel, engenheiro). % predicado que indica que o cargo de Daniel � ser engenheiro
engenheiro_f(isabel).      % predicado que indica que Isabel � uma engenheira
cargo(isabel, engenheiro). % predicado que indica que o cargo de Isabel � engenheira
engenheiro_f(oscar).       % predicado que indica que Oscar � um engenheiro
cargo(oscar, engenheiro).  % predicado que indica que o cargo de Oscar � ser engenheiro
engenheiro_f(tomas).       % predicado que indica que Tomas � um engenheiro
cargo(tomas, engenheiro).  % predicado que indica que o cargo de Tomas � ser engenheiro
engenheiro_f(ana).         % predicado que indica que Ana � uma engenheira
cargo(ana, engenheiro).    % predicado que indica que o cargo de Ana � ser engenheira

% Supervisor (1)
supervisor_f(luis).        % predicado que indica que Luis � supervisor
cargo(luis, supervisor).   % predicado que indica que o cargo de Luis � supervisor

% Supervisor Chefe (1)
supervisor_chefe_f(sonia). % predicado que indica que o Sonia � supervisora chefe
cargo(sonia, supervisor_chefe).  % predicado que indica que o cargo de Sonia � supervisora chefe

% Secret�ria (1)
secretaria_executiva_f(laura).  % predicado que indica que Laura � secretaria executiva
cargo(laura, secretaria_executiva).  %predicado que indica que o cargo de Laura � secretaria executiva

% Diretor (1)
diretor_f(santiago).     % predicado que indica que Santiago � diretor
cargo(santiago, diretor).% predicado que indica que o cargo de Santiago � diretor

% ======================================================================================
% Defini��o da regras
% ======================================================================================

% t�cnicos < engenheiro < supervisor < supervisor_chefe < diretor
% secret�ria < diretor

% Os t�cnicos s�o chefiados por engenheiros.
chefe(X, Y) :- engenheiro_f(X), tecnico_f(Y).
% Os engenheiros s�o chefiados pelos supervisores.
chefe(X, Y) :- supervisor_f(X), engenheiro_f(Y).
% Os analistas tamb�m s�o chefiados pelos supervisores.
chefe(X, Y) :- supervisor_f(X), tecnico_f(Y).
% Os supervisores s�o chefiados pelo supervisor chefe.
chefe(X, Y) :- supervisor_chefe_f(X), supervisor_f(Y).
% O supervisor chefe � chefiado pelo diretor.
chefe(X, Y) :- diretor_f(X), supervisor_chefe_f(Y).
% A secret�ria executiva tamb�m � chefiada pelo diretor.
chefe(X, Y) :- diretor_f(X), secretaria_executiva_f(Y).

% ======================================================================================

% Regras n�o explicitas

% Os supervisores chefes s�o chefes dos tecnicos
chefe(X, Y) :- supervisor_chefe_f(X), tecnico_f(Y).
% Os supervisores chefes s�o chefes dos engenheiros
chefe(X, Y) :- supervisor_chefe_f(X), engenheiro_f(Y).
% O diretor � chefe dos tecnicos
chefe(X, Y) :- diretor_f(X), tecnico_f(Y).
% O diretor � chefe dos engenheiros
chefe(X, Y) :- diretor_f(X), engenheiro_f(Y).
% O diretor � chefe dos supervisores
chefe(X, Y) :- diretor_f(X), supervisor_f(Y).

% ======================================================================================
% Letra A - Quem s�o os chefes dos t�cnicos e por quem eles s�o chefiados?
% ======================================================================================


/*==========================================================================================
||                       CONSULTA                                                         ||
||                                                                                        ||
||  Chefes dos t�cnicos                                                                   ||
||  tecnico_f(Tecnico), chefe(Chefe, Tecnico), chefe(Chefe_do_chefe, Chefe), write('\n'). ||
||                                                                                        ||
==========================================================================================*/

% Ao executar c�digo ir� aparecer 3 linhas, com o nome do t�cnico, seu chefe e o chefe do seu chefe
% Em seguida s� apertar ';' que carregar� os pr�ximos resultados

% ======================================================================================
% Letra B - Quem � o chefe da Ivone e qual � o cargo deste chefe?
% ======================================================================================


/*=========================================================
||                       CONSULTA                        ||
||                                                       ||
||  chefe(X, ivone), cargo(X, Y), write('\n').           ||
||                                                       ||
=========================================================*/

% Busca um X que � chefe da ivone e logo ap�s sua profiss�o
% Em seguida s� apertar ';' que carregar� os pr�ximos resultados

% ======================================================================================
% Letra C - Quem s�o as pessoas chefiados pelo supervisor chefe ou pelo supervisor?
% ======================================================================================


/*===========================================================
||                       CONSULTA                          ||
||                                                         ||
||    Pessoas chefiadas pelo supervisor_chefe              ||
||    chefe(X, Y), supervisor_chefe_f(X), write('\n').     ||
||                                                         ||
===========================================================*/

% Recebe como parametro X e Y, com o X sendo o supervisor chefe, portanto o resultado ser� todas
% as pessoas que o supervisor chefe chefia, sendo assim, ele retornar� o nome de todos os t�cnicos,
% engenheiros, e os supervisores
% Em seguida s� apertar ';' que carregar� os pr�ximos resultados

/*===========================================================
||                       CONSULTA                          ||
||                                                         ||
||    Pessoas chefiadas pelo supervisor                    ||
||    chefe(X, Y), supervisor_f(X), write('\n').           ||
||                                                         ||
===========================================================*/

% Para todos os supervisores X busca as pessoas Y que eles chefiam
% Em seguida s� apertar ';' que carregar� os pr�ximos resultados

% ======================================================================================
% Letra D - Sabendo que Carolina n�o � chefiada pelo diretor, qual � o seu cargo?
% ======================================================================================


/*===========================================================================================================================================
||                                                     CONSULTA                                                                            ||
||                                                                                                                                         ||
||    Verifica se Carolina � chefiada pelo Diretor                                                                                         ||
||    ?- chefe(santiago, carolina); write('Erro: O diretor Santiago n�o chefia essa pessoa, portanto ela n�o trabalha na empresa.').       ||
||                                                                                                                                         ||
===========================================================================================================================================*/

% Nesse c�digo ir� ser verificado se o diretor(santiago) � chefe da carolina, se n�o for,
% exibi a mensagem de Erro, caso for verdade, exibir� apenas um true

% =============
% Fim Parte 2
% =============









