% Carros no estacionamento: 
% https://rachacuca.com.br/logica/problemas/carros-no-estacionamento/

dono(rogerio).
dono(guilherme).
dono(alexandre).
dono(felipe).
dono(gilmar).

cor(amarela).
cor(azul).
cor(branca).
cor(verde).
cor(vermelha).

montadora(alema).
montadora(chinesa).
montadora(francesa).
montadora(italiana).
montadora(japonesa).

placa(aaa1111).
placa(bbb2222).
placa(ccc3333).
placa(ddd4444).
placa(eee5555).

ano(2007).
ano(2008).
ano(2009).
ano(2010).
ano(2011).

tipo(crossover).
tipo(hatch).
tipo(pickup).
tipo(sedan).
tipo(suv).

diferentes([]).
diferentes([H|T]):- not(member(H,T)), diferentes(T).

modelo([
      (D1, C1, M1, P1, A1, T1),
	  (D2, C2, M2, P2, A2, T2),
	  (D3, C3, M3, P3, A3, T3),
	  (D4, C4, M4, P4, A4, T4),
	  (D5, C5, M5, P5, A5, T5)
]) :-
    %%%%%%%%%%%%%%%%%%%%%%%% Dono
	dono(D1), dono(D2), dono(D3), dono(D4), dono(D5),
	diferentes([D1, D2, D3, D4, D5]),
	(D1==rogerio; D5==rogerio), %O carro do Rogério foi estacionado em um dos extremos
    
    %%%%%%%%%%%%%%%%%%%%%%%% Cor
	cor(C1), cor(C2), cor(C3), cor(C4), cor(C5),
	diferentes([C1, C2, C3, C4, C5]),
	C2==vermelha, % Na segunda vaga encontra-se o carro Vermelho
	( 
    	(C1==branca, D2==gilmar);
		(C2==branca, D3==gilmar);
		(C3==branca, D4==gilmar);
		(C4==branca, D5==gilmar)
    ), % O carro do Gilmar está exatamente à direita do carro Branco
    
    %%%%%%%%%%%%%%%%%%%%%%%% Montadora
	montadora(M1), montadora(M2), montadora(M3), montadora(M4), montadora(M5),
	diferentes([M1, M2, M3, M4, M5]),

	%12.O veículo Francês está na quarta vaga
	M4==francesa,

	%13.O carro Branco está exatamente à direita do veículo Japonês
	(
	(M1==japonesa, C2==branca);
	(M2==japonesa, C3==branca);
	(M3==japonesa, C4==branca);
	(M4==japonesa, C5==branca)),

	%16.O veículo Chinês está em alguma vaga à esquerda do carro Branco
	(
	(C5==branca, (M1==chinesa; M2==chinesa; M3==chinesa; M4==chinesa));
	(C4==branca, (M1==chinesa; M2==chinesa; M3==chinesa));
	(C3==branca, (M1==chinesa; M2==chinesa));
	(C2==branca, M1==chinesa)),

	%11.O carro Alemão está em algum lugar à direita do carro do Felipe
	(
	(D1==felipe, (M2==alema; M3==alema; M4==alema; M5==alema));
	(D2==felipe, (M3==alema; M4==alema; M5==alema));
	(D3==felipe, (M4==alema; M5==alema));
	(D4==felipe, M5==alema)),

	%%%%%%%%%%%%%%%%%%%%%%%% Placa
	placa(P1), placa(P2), placa(P3), placa(P4), placa(P5),
	diferentes([P1, P2, P3, P4, P5]),

	%21.O carro do Alexandre está em algum lugar entre os carros de placas DDD-4444 e AAA-1111, com este último à direita
	(
	(P1==ddd4444, D2==alexandre, (P3==aaa1111; P4==aaa1111; P5==aaa1111));
	(P1==ddd4444, D3==alexandre, (P4==aaa1111; P5==aaa1111));
	(P1==ddd4444, D4==alexandre, P5==aaa1111);
	(P2==ddd4444, D3==alexandre, (P4==aaa1111; P5==aaa1111));
	(P2==ddd4444, D4==alexandre, P5==aaa1111);
	(P3==ddd4444, D4==alexandre, P5==aaa1111)
	),

	%10.O carro com a placa DDD-4444 está ao lado do carro do Guilherme
	(
	(P1==ddd4444, D2==guilherme);
	(P2==ddd4444, (D1==guilherme; D3==guilherme));
	(P3==ddd4444, (D2==guilherme; D4==guilherme));
	(P4==ddd4444, (D3==guilherme; D5==guilherme));
	(P5==ddd4444, D4==guilherme)
	),

	%%%%%%%%%%%%%%%%%%%%%%%% Ano
	ano(A1), ano(A2), ano(A3), ano(A4), ano(A5),
	diferentes([A1, A2, A3, A4, A5]),

	%6.O carro fabricado em 2010 está na vaga do meio
	A3==2010,

	%19.O veículo Italiano foi fabricado em 2007
	(
	(M1==italiana, A1==2007);
	(M2==italiana, A2==2007);
	(M3==italiana, A3==2007);
	(M4==italiana, A4==2007);
	(M5==italiana, A5==2007)
	),

	%8.A placa CCC-3333 pertence ao veículo fabricado em 2007
	(
	(P1==ccc3333, A1==2007);
	(P2==ccc3333, A2==2007);
	(P3==ccc3333, A3==2007);
	(P4==ccc3333, A4==2007);
	(P5==ccc3333, A5==2007)
	),

	%7.O carro de 2008 está ao lado do carro Azul
	(
	(A1==2008, C2==azul);
	(A2==2008, (C1==azul; C3==azul));
	(A3==2008, (C2==azul; C4==azul));
	(A4==2008, (C3==azul; C5==azul));
	(A5==2008, C4==azul)
	),

	%%%%%%%%%%%%%%%%%%%%%%%% Tipo
	tipo(T1), tipo(T2), tipo(T3), tipo(T4), tipo(T5),
	diferentes([T1, T2, T3, T4, T5]),

	%5.A Pickup está na última vaga da direita
	T5==pickup,

	%3.O SUV está na segunda vaga
	T2==suv,

	%9.O Sedan tem placa EEE-5555
	(
	(P1==eee5555, T1==sedan);
	(P2==eee5555, T2==sedan);
	(P3==eee5555, T3==sedan);
	(P4==eee5555, T4==sedan);
	(P5==eee5555, T5==sedan)),

	%1.O veículo fabricado em 2009 é uma Pickup
	(
	(T1==pickup, A1==2009);
	(T2==pickup, A2==2009);
	(T3==pickup, A3==2009);
	(T4==pickup, A4==2009);
	(T5==pickup, A5==2009)),

	%4.O Sedan está ao lado da Pickup
	(
	(T1==sedan, T2==pickup);
	(T2==sedan, (T1==pickup; T3==pickup));
	(T3==sedan, (T2==pickup; T4==pickup));
	(T4==sedan, (T3==pickup; T5==pickup));
	(T5==sedan, T4==pickup)
	),

	%2.O Alexandre dirige o Crossover
	(
	(D1==alexandre, T1==crossover);
	(D2==alexandre, T2==crossover);
	(D3==alexandre, T3==crossover);
	(D4==alexandre, T4==crossover);
	(D5==alexandre, T5==crossover)
	),

	%15.O Crossover é Amarelo
	(
	(T1==crossover, C1==amarela);
	(T2==crossover, C2==amarela);
	(T3==crossover, C3==amarela);
	(T4==crossover, C4==amarela);
	(T5==crossover, C5==amarela)
	),

	%14.O carro Italiano está exatamente à esquerda do Crossover
	(
	(M1==italiana, T2==crossover);
	(M2==italiana, T3==crossover);
	(M3==italiana, T4==crossover);
	(M4==italiana, T5==crossover)).
    

imprime_SOL([V1, V2, V3, V4, V5]):-
	writeln("\nVaga 1" : V1),
	writeln("Vaga 2" : V2),
	writeln("Vaga 3" : V3),
	writeln("Vaga 4" : V4),
	writeln("Vaga 5" : V5),
	!.

imprime_SOL([_, _, _, _, _]):- nl,
	                       write("NAO USOU A REGRA ACIMA").




imprime_lista([]):- write('\n').
	imprime_lista([H|T]):- write('\n'),
	                       write(H), write('\n'),
	                       imprime_lista(T).





%modelo(L), imprime_lista(L)





