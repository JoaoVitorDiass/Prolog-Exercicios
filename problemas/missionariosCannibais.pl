% Representa um estado como [CL,ML,B,CR,MR]
inicio([3,3,esquerda,0,0]).
objetivo([0,0,direita,3,3]).

estado_legal(CL,ML,CR,MR) :-
	% verifica se o estado é legal
	ML >= 0, CL >= 0, MR >= 0, CR >= 0,
	(ML >= CL ; ML = 0),
	(MR >= CR ; MR = 0).

% Movimentos possíveis:
mover([CL,ML,esquerda,CR,MR],[CL,ML2,direita,CR,MR2]):-
	% Dois missionários atravessam da esquerda para a direita
	MR2 is MR + 2,
	ML2 is ML - 2,
	estado_legal(CL,ML2,CR,MR2).

mover([CL,ML,esquerda,CR,MR],[CL2,ML,direita,CR2,MR]):-
	% Dois canibais atravessam da esquerda para a direita
	CR2 is CR + 2,
	CL2 is CL - 2,
	estado_legal(CL2,ML,CR2,MR).

mover([CL,ML,esquerda,CR,MR],[CL2,ML2,direita,CR2,MR2]):-
	% Um missionário e um canibal atravessam da esquerda para a direita
	CR2 is CR + 1,
	CL2 is CL - 1,
	MR2 is MR + 1,
	ML2 is ML - 1,
	estado_legal(CL2,ML2,CR2,MR2).

mover([CL,ML,esquerda,CR,MR],[CL,ML2,direita,CR,MR2]):-
	% Um missionário atravessa da esquerda para a direita
	MR2 is MR + 1,
	ML2 is ML - 1,
	estado_legal(CL,ML2,CR,MR2).

mover([CL,ML,esquerda,CR,MR],[CL2,ML,direita,CR2,MR]):-
	% Um canibal atravessa da esquerda para a direita
	CR2 is CR + 1,
	CL2 is CL - 1,
	estado_legal(CL2,ML,CR2,MR).

mover([CL,ML,direita,CR,MR],[CL,ML2,esquerda,CR,MR2]):-
	% Dois missionários atravessam da direita para a esquerda
	MR2 is MR - 2,
	ML2 is ML + 2,
	estado_legal(CL,ML2,CR,MR2).

mover([CL,ML,direita,CR,MR],[CL2,ML,esquerda,CR2,MR]):-
	% Dois canibais atravessam da direita para a esquerda
	CR2 is CR - 2,
	CL2 is CL + 2,
	estado_legal(CL2,ML,CR2,MR).

mover([CL,ML,direita,CR,MR],[CL2,ML2,esquerda,CR2,MR2]):-
	% Um missionário e um canibal atravessam da direita para a esquerda
	CR2 is CR - 1,
	CL2 is CL + 1,
	MR2 is MR - 1,
	ML2 is ML + 1,
	estado_legal(CL2,ML2,CR2,MR2).

mover([CL,ML,direita,CR,MR],[CL,ML2,esquerda,CR,MR2]):-
	% Um missionário atravessa da direita para a esquerda
	MR2 is MR - 1,
	ML2 is ML + 1,
	estado_legal(CL,ML2,CR,MR2).

mover([CL,ML,direita,CR,MR],[CL2,ML,esquerda,CR2,MR]):-
	% Um canibal atravessa da direita para a esquerda
	CR2 is CR - 1,
	CL2 is CL + 1,
	estado_legal(CL2,ML,CR2,MR).

% Chamada recursiva para resolver o problema
caminho([CL1,ML1,B1,CR1,MR1],[CL2,ML2,B2,CR2,MR2],Explorado,ListaMovimentos) :- 
   mover([CL1,ML1,B1,CR1,MR1],[CL3,ML3,B3,CR3,MR3]), 
   not(member([CL3,ML3,B3,CR3,MR3],Explorado)),
   caminho([CL3,ML3,B3,CR3,MR3],[CL2,ML2,B2,CR2,MR2],[[CL3,ML3,B3,CR3,MR3]|Explorado],[ [[CL3,ML3,B3,CR3,MR3],[CL1,ML1,B1,CR1,MR1]] | ListaMovimentos ]).

% Solução encontrada
caminho([CL,ML,B,CR,MR],[CL,ML,B,CR,MR],_,ListaMovimentos):- 
	imprimir(ListaMovimentos).

% Impressão da solução
imprimir([]) :- nl. 
imprimir([[A,B]|ListaMovimentos]) :- 
	imprimir(ListaMovimentos), 
   	write(B), write(' -> '), write(A), nl.

% Encontra a solução para o problema dos missionários e canibais
resolver :- 
   caminho([3,3,esquerda,0,0],[0,0,direita,3,3],[[3,3,esquerda,0,0]],_).
