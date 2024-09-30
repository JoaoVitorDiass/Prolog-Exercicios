
% um elemento pertence a uma lista?
pertence(X, [X|_]).
pertence(X, [_|Tail]) :- pertence(X,Tail).

% um elemento é o ultimo elemento de uma lista?

ehUltimo(X,[X]).
ehUltimo(X,[_|Tail]) :- ehUltimo(X,Tail).

% lista tem dois elementos consecutivos?
% ex: 1 e 2 são consecutivos na lista [2,3,4,5,1,2]
consecutivos(X,Y,[X,Y|_]).
consecutivos(X,Y,[_|Tail] ) :- consecutivos(X,Y,Tail).

% retorna o tamanho da lista
tamanho([],0).
tamanho([_|Tail],Tamanho) :- tamanho(Tail, TamanhoAux),
                            Tamanho is 1 + TamanhoAux.

% lista 1 eh prefixo da lista 2
prefixo([],_).
prefixo([H1|T1],[H2|T2]) :- H1 = H2,
                            prefixo(T1,T2).

% lista 1 eh sufixo de lista 2
sufixo(L,L).
sufixo(L1,[_|T2]) :- sufixo(L1,T2).

% recebe uma lista e retorna apenas uma lista contendo os numeros pares
pares([],[]).
pares([Head|Tail],ListaPares) :- pares(Tail, TailAux),  (
                                    Head mod 2 =:= 0 -> ListaPares = [Head | TailAux] ; 
                                    ListaPares = TailAux
                                ).

% todos elementos da lista sao iguals o atomo 'a'
todosA([]).
todosA([Head|Tail]) :- Head = a, todosA(Tail).

% verifica se a lista contem pelomenos um elemento 1
contem1(Lista) :- pertence(1,Lista).


/**************************************************************************/

traducao(one, um).
traducao(two, dois).
traducao(three, tres).
traducao(four, quatro).
traducao(five, cinco).
traducao(six, seis).
traducao(seven, sete).
traducao(eight, oito).
traducao(nine, nove).

traduzir([],[]).
traduzir([Head|Tail], [Cabeca|Cauda]) :- traducao(Head,Cabeca),
                                        traduzir(Tail, Cauda).