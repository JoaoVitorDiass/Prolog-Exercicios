estado(ac, 'Rio Branco').
estado(al, 'Maceio').
estado(ap, 'Macapa').
estado(am, 'Manaus').
estado(ba, 'Salvador').
estado(ce, 'Fortaleza').
estado(df, 'Brasilia').
estado(es, 'Vitoria').
estado(go, 'Goiania').
estado(ma, 'Sao Luís').
estado(mt, 'Cuiaba').
estado(ms, 'Campo Grande').
estado(mg, 'Belo Horizonte').
estado(pa, 'Belem').
estado(pb, 'Joao Pessoa').
estado(pr, 'Curitiba').
estado(pe, 'Recife').
estado(pi, 'Teresina').
estado(rj, 'Rio de Janeiro').
estado(rn, 'Natal').
estado(rs, 'Porto Alegre').
estado(ro, 'Porto Velho').
estado(rr, 'Boa Vista').
estado(sc, 'Florianopolis').
estado(sp, 'Sao Paulo').
estado(se, 'Aracaju').
estado(to, 'Palmas').

capital(Estado, Capital) :- estado(Estado, Capital).
