mulher(pam).
mulher(liz).
mulher(pat).
mulher(ann).

homem(tom).
homem(bob).
homem(jim).

genitor(pam,bob).
genitor(tom,bob).
genitor(tom,liz).
genitor(bob,ann).
genitor(bob,pat).
genitor(pat,jim). 

prole(X,Y) :- genitor(Y,X).
mae(X,Y) :- genitor(X,Y), mulher(X).
avos(X,Z) :- genitor(X,Y), genitor(Y,Z).

% DESCENDENTE SEM RECURSAO
/*
descendente(X,Y) :- genitor(Y,X).
descendente(X,Y) :- genitor(Y,Z), genitor(Z,X).
descendente(X,Y) :- genitor(Y,Z), genitor(Z,W), genitor(W,Y).
*/

% DESCENDENTE COM RECURSAO
descendente(X,Y) :- genitor(Y,X).
descendente(X,Y) :- genitor(Y,W), descendente(X,W).