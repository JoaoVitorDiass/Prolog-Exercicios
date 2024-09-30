aluno(joao, calculo).
aluno(maria, calculo).
aluno(joel, programacao).
aluno(joel, estrutura).

frequenta(joao, puc).
frequenta(maria, puc).
frequenta(joel, ufrj).

professor(carlos, calculo).
professor(ana_paula, estrutura).
professor(pedro, programacao).

funcionario(pedro, ufrj).
funcionario(ana_paula, puc).
funcionario(carlos, puc).
funcionario(helbert, puc).

% saoAlunosDoProfessor(Professor, Alunos)
saoAlunosDoProfessor(X,Y) :- professor(X,Materia), aluno(Y,Materia).

% associadoFaculdade(Aluno ou Professor)
associadoFaculdade(X) :- frequenta(X,_) ; funcionario(X, _) , professor(X, _).