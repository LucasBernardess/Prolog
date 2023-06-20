/*====================================
||                                  ||
||  TRABALHO PRÁTICO - PROLOG       ||
||                                  ||
||  UFSJ - Ciência da Computação    ||
||  Lógica aplicada a Computação    ||
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

/*Para inserir um elemento no final de uma lista é necessário percorrer a lista até chegar na última posição
separando a cabeça e a cauda recursivamente até que a lista esteja vazia. Com a lista vazia, o proximo passo
é inserir o elemento infomado pelo usuário, após isso a lista é chamada recursivamente novamente inserindo os
elementos anteriores um por um */

adicionaNoFinal(X, [], [X]). % Caso base: se a lista é vazia, L2 será [X]
adicionaNoFinal(X, [Cab|Cau], [Cab|L2]) :-
    adicionaNoFinal(X, Cau, L2). % Caso recursivo: mantém o primeiro elemento e adiciona X no final da cauda


% ======================================================================================
% Letra B - Remover elemento da Lista
% ======================================================================================

/* Para remover um elemento de uma lista é necessario percorrê-la até que seja encontrada a posição informada
pelo usuário, separando cabeça e cauda da lista recursivamente. No momento que o elemento a ser removido é a
cabeça da lista esse elemento é removido, após isso o elemento que estava na cauda é substituido pelo resto da
lista original */


remover(1, [_|Cau], Cau). % Caso base: se a posição é 1, remove o primeiro elemento da lista
remover(X, [Cab|Cau], [Cab|L2]) :-
    X > 1, X1 is X - 1, remover(X1, Cau, L2). % Caso recursivo: mantém o primeiro elemento e remove da cauda


% ======================================================================================
% Letra C - Inverter Lista
% ======================================================================================

/*Para inverter uma lista é necessário  é necessário inserir o elemento cabeça de uma lista em outra recursivamente
até que a primeira lista esteja vazia e a segunda completa.  No caso base, quando a lista está vazia, a lista invertida
é igual ao acumulador. No caso recursivo, a cauda da lista é invertida e a cabeça é adicionada ao acumulador. Essa
recursão continua até que a lista original seja completamente percorrida, resultando na lista invertida. */

inverte(L1, L2) :-
    inverteLista(L1, [], L2).

inverteLista([], Acc, Acc). % Caso base: quando a lista original está vazia, a lista invertida é igual ao acumulador
inverteLista([Cab|Cal], Acc, L2) :-
    inverteLista(Cal, [Cab|Acc], L2). % Caso recursivo: inverte a cauda e adiciona a cabeça no acumulador


% ======================================================================================
% Letra D - Tamanho da Lista
% ======================================================================================

/* Para se obter o tamanho de uma lista é necessário contar quantas vezes é feita a chamada recursiva.
No caso base, quando a lista está vazia, o tamanho é definido como 0. No caso recursivo, o predicado chama a si mesmo
com o restante da lista e calcula o tamanho desse restante. O tamanho final é calculado adicionando 1 ao tamanho do restante.
A recursão continua até que a lista seja completamente percorrida, e o tamanho total é retornado.*/

tamanho([], 0). % Caso base: lista vazia tem tamanho 0

tamanho([_|Resto], Tamanho) :-
  tamanho(Resto, TamanhoResto), % Calcula o tamanho do restante da lista
  Tamanho is TamanhoResto + 1. % Incrementa o tamanho pelo restante da lista


% ======================================================================================
% Letra E - Retorna a soma de todos os ELEMENTOS da Lista
% ======================================================================================

/*Para se obter a soma da lista é necessário percorrê-la recursivamente somandos todos os elementos.
No caso base, quando a lista está vazia, a soma é definida como 0. No caso recursivo, o predicado chama
a si mesmo com o restante da lista e calcula a soma desse restante. O valor final é obtido somando o elemento
atual com a soma dos elementos restantes. A recursão continua até que a lista seja completamente percorrida,
e o valor total da soma é retornado. */

soma([], 0). % Caso base: a soma de uma lista vazia é 0
soma([Cab|Cal], X) :-
    soma(Cal, X1), X is X1 + Cab. % Caso recursivo: soma o elemento atual com a soma dos elementos restantes


% ======================================================================================
% Testes de Compilações da Parte 1
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
% Declaração das Proposições
% ======================================================================================

% Técnicos (2)
tecnico_f(rogerio).        % predicado que indica que Rogerio é um tecnico
cargo(rogerio, tecnico).   % predicado que indica que o cargo de Rogerio é ser tecnico
tecnico_f(ivone).          % predicado que indica que Ivone é tecnica
cargo(ivone, tecnico).     % predicado que indica que o cargo de Ivone é ser tecnica

% Engenheiros (5)
engenheiro_f(daniel).      % predicado que indica que Daniel é um engenheiro
cargo(daniel, engenheiro). % predicado que indica que o cargo de Daniel é ser engenheiro
engenheiro_f(isabel).      % predicado que indica que Isabel é uma engenheira
cargo(isabel, engenheiro). % predicado que indica que o cargo de Isabel é engenheira
engenheiro_f(oscar).       % predicado que indica que Oscar é um engenheiro
cargo(oscar, engenheiro).  % predicado que indica que o cargo de Oscar é ser engenheiro
engenheiro_f(tomas).       % predicado que indica que Tomas é um engenheiro
cargo(tomas, engenheiro).  % predicado que indica que o cargo de Tomas é ser engenheiro
engenheiro_f(ana).         % predicado que indica que Ana é uma engenheira
cargo(ana, engenheiro).    % predicado que indica que o cargo de Ana é ser engenheira

% Supervisor (1)
supervisor_f(luis).        % predicado que indica que Luis é supervisor
cargo(luis, supervisor).   % predicado que indica que o cargo de Luis é supervisor

% Supervisor Chefe (1)
supervisor_chefe_f(sonia). % predicado que indica que o Sonia é supervisora chefe
cargo(sonia, supervisor_chefe).  % predicado que indica que o cargo de Sonia é supervisora chefe

% Secretária (1)
secretaria_executiva_f(laura).  % predicado que indica que Laura é secretaria executiva
cargo(laura, secretaria_executiva).  %predicado que indica que o cargo de Laura é secretaria executiva

% Diretor (1)
diretor_f(santiago).     % predicado que indica que Santiago é diretor
cargo(santiago, diretor).% predicado que indica que o cargo de Santiago é diretor

% ======================================================================================
% Definição da regras
% ======================================================================================

% técnicos < engenheiro < supervisor < supervisor_chefe < diretor
% secretária < diretor

% Os técnicos são chefiados por engenheiros.
chefe(X, Y) :- engenheiro_f(X), tecnico_f(Y).
% Os engenheiros são chefiados pelos supervisores.
chefe(X, Y) :- supervisor_f(X), engenheiro_f(Y).
% Os analistas também são chefiados pelos supervisores.
chefe(X, Y) :- supervisor_f(X), tecnico_f(Y).
% Os supervisores são chefiados pelo supervisor chefe.
chefe(X, Y) :- supervisor_chefe_f(X), supervisor_f(Y).
% O supervisor chefe é chefiado pelo diretor.
chefe(X, Y) :- diretor_f(X), supervisor_chefe_f(Y).
% A secretária executiva também é chefiada pelo diretor.
chefe(X, Y) :- diretor_f(X), secretaria_executiva_f(Y).

% ======================================================================================

% Regras não explicitas

% Os supervisores chefes são chefes dos tecnicos
chefe(X, Y) :- supervisor_chefe_f(X), tecnico_f(Y).
% Os supervisores chefes são chefes dos engenheiros
chefe(X, Y) :- supervisor_chefe_f(X), engenheiro_f(Y).
% O diretor é chefe dos tecnicos
chefe(X, Y) :- diretor_f(X), tecnico_f(Y).
% O diretor é chefe dos engenheiros
chefe(X, Y) :- diretor_f(X), engenheiro_f(Y).
% O diretor é chefe dos supervisores
chefe(X, Y) :- diretor_f(X), supervisor_f(Y).

% ======================================================================================
% Letra A - Quem são os chefes dos técnicos e por quem eles são chefiados?
% ======================================================================================


/*==========================================================================================
||                       CONSULTA                                                         ||
||                                                                                        ||
||  Chefes dos técnicos                                                                   ||
||  tecnico_f(Tecnico), chefe(Chefe, Tecnico), chefe(Chefe_do_chefe, Chefe), write('\n'). ||
||                                                                                        ||
==========================================================================================*/

% Ao executar código irá aparecer 3 linhas, com o nome do técnico, seu chefe e o chefe do seu chefe
% Em seguida só apertar ';' que carregará os próximos resultados

% ======================================================================================
% Letra B - Quem é o chefe da Ivone e qual é o cargo deste chefe?
% ======================================================================================


/*=========================================================
||                       CONSULTA                        ||
||                                                       ||
||  chefe(X, ivone), cargo(X, Y), write('\n').           ||
||                                                       ||
=========================================================*/

% Busca um X que é chefe da ivone e logo após sua profissão
% Em seguida só apertar ';' que carregará os próximos resultados

% ======================================================================================
% Letra C - Quem são as pessoas chefiados pelo supervisor chefe ou pelo supervisor?
% ======================================================================================


/*===========================================================
||                       CONSULTA                          ||
||                                                         ||
||    Pessoas chefiadas pelo supervisor_chefe              ||
||    chefe(X, Y), supervisor_chefe_f(X), write('\n').     ||
||                                                         ||
===========================================================*/

% Recebe como parametro X e Y, com o X sendo o supervisor chefe, portanto o resultado será todas
% as pessoas que o supervisor chefe chefia, sendo assim, ele retornará o nome de todos os técnicos,
% engenheiros, e os supervisores
% Em seguida só apertar ';' que carregará os próximos resultados

/*===========================================================
||                       CONSULTA                          ||
||                                                         ||
||    Pessoas chefiadas pelo supervisor                    ||
||    chefe(X, Y), supervisor_f(X), write('\n').           ||
||                                                         ||
===========================================================*/

% Para todos os supervisores X busca as pessoas Y que eles chefiam
% Em seguida só apertar ';' que carregará os próximos resultados

% ======================================================================================
% Letra D - Sabendo que Carolina não é chefiada pelo diretor, qual é o seu cargo?
% ======================================================================================


/*===========================================================================================================================================
||                                                     CONSULTA                                                                            ||
||                                                                                                                                         ||
||    Verifica se Carolina é chefiada pelo Diretor                                                                                         ||
||    ?- chefe(santiago, carolina); write('Erro: O diretor Santiago não chefia essa pessoa, portanto ela não trabalha na empresa.').       ||
||                                                                                                                                         ||
===========================================================================================================================================*/

% Nesse código irá ser verificado se o diretor(santiago) é chefe da carolina, se não for,
% exibi a mensagem de Erro, caso for verdade, exibirá apenas um true

% =============
% Fim Parte 2
% =============









