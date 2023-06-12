% Letra A
insereFinal([], Elemento, [Elemento]).
% O caso base da recursao recebe uma lista vazia e insere o Elemento
insereFinal([Cabeca|Cauda], Elemento, [Cabeca|Resto]) :-
% Conserva a Cabeca da lista (primeiro elemento) e repete a operacao com a Cauda
    insereFinal(Cauda, Elemento, Resto).
    % Percorre a lista recursivamente ate que ela esteja completamente vazia, executando o caso base e reconstruindo a lista


%Letra B
/* Para remover um elemento numa posicao informada pelo usuario eh necessario percorrer a lista ate chegar
nessa posicao, separando a cabeca e a cauda da lista recursivamente. A cada chamada o indice eh subtraido em
1 unidade ate que se iguale a 1 (momento em que o elemento a ser removido esta na cabeca da lista), apos isso
o elemento que se localizava na cauda eh substituido pelo resto da lista original. */

% USO DO PREDICADO:
% remove(Lista, Indice, Resultado)

remove([_|Cauda], 1, Cauda).    % O caso base ocorre quando o indice a ser removido eh igual a 1 (cabeca da lista), recebendo uma lista e retornando sua Cauda
remove([Cabeca|Cauda], Posicao, [Cabeca|Resto]) :-      % O predicado recebe a Posicao a ser removida, a lista e conserva a Cabeca utilizando a Cauda nas chamadas recursivas
    NovaPosicao is Posicao - 1,     % Descresce o a Posicao em 1 unidade em toda repeticao, atribuindo o valor para a variavel NovaPosicao
    remove(Cauda, NovaPosicao, Resto).      % Percorre a lista recursivamente usando a Cauda ate que a NovaPosicao para inserir o elemento seja o primeiro (cabeca)


%Letra C

/* Para inverter uma lista eh necessario inserir o elemento cabeca de uma lista em outra recursivamente ate
que a primeira lista esteja vazia e a segunda completa. O metodo de concatenar serve para inserir os elementos
na lista final, tornando o predicado "inverte" mais simples de ser construido. */

% USO DO PREDICADO:
% inverte(Lista, Resultado)

concatena([], Elemento, Elemento).    % Caso base da recursao, um Elemento inserido numa lista vazia eh o proprio Elemento
concatena([Cabeca|Lista1], Lista2, [Cabeca|Lista3]) :-    % Recursivamente junta a Cabeca com a Cauda, formando a Lista3 com os elementos da Lista1 e da Lista2
    concatena(Lista1, Lista2, Lista3).

inverte([], []).    % Caso base da recursao, o inverso de uma lista vazia eh ela mesma
inverte([Cabeca|Resto], ListaInversa) :-      % Separa a Cabeca do Resto para usar nas chamadas recursivas
    inverte(Resto, Lista),     % Recursivamente usa o Resto para realizar novamente o predicado
    concatena(Lista, [Cabeca], ListaInversa).    % Insere a Cabeca na Lista formando a ListaInversa ate que o ultimo elemento seja o primeiro





%Letra D




%Letra E
soma(0,0).
soma(X,Y):- X1 is X-1, soma(X1,Y1),Y is Y1 + X.
