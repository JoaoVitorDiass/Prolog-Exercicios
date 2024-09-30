oposto(d,e).
oposto(e,d).

pode_ir([F,C,L,R],[NF,C,L,R]) :- oposto(F,NF).
pode_ir([FC,FC,L,R],[NFC,NFC,L,R]) :- oposto(FC,NFC).
pode_ir([FL,C,FL,R],[NFL,C,NFL,R]) :- oposto(FL,NFL).
pode_ir([FR,C,L,FR],[NFR,C,L,NFR]) :- oposto(FR,NFR).

permitido([FC,FC,_,_]).
permitido([X,C,X,X]) :- oposto(X,C).

dfs(O,D,C) :- rota(O,D,[O],C).
rota(X,X,C,C).
rota(O,D,CAux, C) :- pode_ir(O,V), permitido(V), not(member(V,CAux)), rota(V,D,[V | CAux], C).

dfs([e,e,e,e],[d,d,d,d],C), write(C).