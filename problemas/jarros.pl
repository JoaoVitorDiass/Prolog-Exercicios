verificaLimites(Jarro7, Jarro5):- Jarro7>=0, Jarro7=<7, Jarro5>=0, Jarro5=<5.

% Despeja do jarro de 5L para o de 7L até o de 7L encher
movimenta((Jarro7, Jarro5), (7, NovoJarro5)) :- 
                        NovoJarro5 is Jarro7 + Jarro5 - 7, Jarro7 + Jarro5 > 7, verificaLimites(7, NovoJarro5).

% Despeja do jarro de 5L para o de 7L sem encher o de 7L
movimenta((Jarro7, Jarro5), (0, NovoJarro5)) :- 
                        NovoJarro5 is Jarro7 + Jarro5, Jarro7 + Jarro5 =< 7, verificaLimites(0, NovoJarro5).

% Despeja do jarro de 7L para o de 5L até o de 5L encher
movimenta((Jarro7, Jarro5), (NovoJarro7, 5)) :- 
                        NovoJarro7 is Jarro7 + Jarro5 - 5, Jarro7 + Jarro5 > 5, verificaLimites(NovoJarro7, 5).

% Despeja do jarro de 7L para o de 5L sem encher o de 5L
movimenta((Jarro7, Jarro5), (NovoJarro7, 0)) :- 
                        NovoJarro7 is Jarro7 + Jarro5, Jarro7 + Jarro5 =< 5, verificaLimites(NovoJarro7, 0).

% Enche o jarro de 7L
movimenta((Jarro7, Jarro5), (7, Jarro5)) :- 
                        Jarro7 =< 7, Jarro7 >= 0.

% Enche o jarro de 5L
movimenta((Jarro7, Jarro5), (Jarro7, 5)) :- 
                    Jarro5 =< 5, Jarro5 >= 0.

% Esvazia o jarro de 5L
movimenta((Jarro7, Jarro5), (Jarro7, 0)) :- 
            Jarro5 >= 0.

% Esvazia o jarro de 7L
movimenta((Jarro7, Jarro5), (0, Jarro5)) :- 
                    Jarro7 >= 0.

resolver([(J7Atual, J5Atual)|R], [(6, J5Novo), (J7Atual, J5Atual)|R]):- 
                        movimenta((J7Atual, J5Atual), (6, J5Novo)), !.

resolver([(J7Atual, J5Atual)|R], Caminho) :- 
                            movimenta((J7Atual, J5Atual), (J7Novo, J5Novo)),
                not(member((J7Novo, J5Novo), [(J7Atual, J5Atual)|R])),
                            resolver([(J7Novo, J5Novo), (J7Atual, J5Atual)|R], Caminho).

resolver(ListaCaminhos) :- 
                resolver([(0,0)], Caminho),
                reverse(Caminho, ListaCaminhos).
