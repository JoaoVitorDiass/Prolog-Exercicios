tipo(a).
tipo(b).
tipo(ab).
tipo(o).

doa(a,a).
doa(a,ab).
doa(b,b).
doa(b,ab).
doa(ab,ab).
doa(o,a).
doa(o,b).
doa(o,ab).
doa(o,o).

recebe(X,Y) :- doa(Y,X).