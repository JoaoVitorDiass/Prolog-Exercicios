
soma(A,B,Resultado) :- Resultado is A + B.
subtracao(A,B,Resultado) :- Resultado is A - B.
divisao(A,B,Resultado) :- Resultado is A / B.
multiplicacao(A,B,Resultado) :- Resultado is A * B.

/*------------------------------------------------------------*/

maiorQueCem(X) :- (X > 100, write("Eh maior que cem!"));
                (X = 100, write("Eh igual a cem!"));
                (X < 100, write("Eh menor que cem!")).

/*------------------------------------------------------------*/

nota(joao,5.0).
nota(mariana,9.0).
nota(joaqum,4.5).
nota(maria,6.0).
nota(cleuza,8.5).
nota(mara,4.0).
nota(joana,8.5).
nota(jose,6.5).
nota(mary,10.0).

situacao(Aluno) :- nota(Aluno, Nota) , (
                    ( Nota >= 7, write("Aprovado") ) ;
                    ( Nota >= 5 , Nota < 7, write("Recuperacao") ) ;
                    ( Nota < 5 , write("Reprovado") )
                ).
                    
/*------------------------------------------------------------*/

imc(Peso, Altura) :- X is Peso / ( Altura * Altura ), write("Seu IMC eh: "), write(X).
