/* 1.	Implementar a definição das tabelas abaixo (Comandos DDL), incluindo as chaves primárias e estrangeiras:

	MATRICULA ((#CodAluno, #CodDisc, *DataMatricula)
	ALUNO (#CodAluno, *NomeAluno, oEmailAluno)
	DISCIPLINA (#CodDisc, *NomeDisc, *CodProf)
	PROFESSOR (#CodProf, *NomeProf)

Legenda: 	# Chave Primária
		* Atributo Obrigatório
		o Atributo Opcional

2. Implementar os comandos de SQL solicitados (Comandos DML):


2.1 Monte uma lista das matriculas realizadas no mês de janeiro de 2009, apresentando nome do aluno, nome da disciplina, nome do professor
e data de matrica, com ordenção crescente pelo nome do aluno e disciplina.

2.2 Obtenha uma relação das disciplinas com nome da disciplina e nro de alunos matriculados, para as disciplinas que possuem mais de 
25 alunos matriculados.

2.3 Matricule a aluna ‘MANOELA’ na disciplina ‘PROJETO DE BANCO DE DADOS’ ministrada pelo professor ‘ROBERTO PETRY’ na data de hoje.

2.4 Substitua o professor ‘ROBERTO PETRY’ por ‘PETER CHEN’ na disciplina de ‘PROJETO DE BANCO DE DADOS’;
*/

--1
CREATE TABLE professor
( 
codprof number(5) NOT NULL,
nomeprof varchar2(100) NOT NULL
);

ALTER TABLE professor
ADD CONSTRAINT  prof_pk  PRIMARY KEY (codprof);


CREATE TABLE aluno(
codaluno number(10) NOT NULL,
nomealuno varchar2(100) NOT NULL,
emailaluno varchar2(50)
);

ALTER TABLE aluno
ADD CONSTRAINT  aluno_pk  PRIMARY KEY (codaluno);

CREATE TABLE disciplina (
coddisc number(10) NOT NULL,
nomedisc varchar2(100) NOT NULL,
codprof number(5) NOT NULL
);

ALTER TABLE disciplina
ADD CONSTRAINT  disciplina_pk  PRIMARY KEY (coddisc);

ALTER TABLE disciplina
ADD CONSTRAINT  disciplina_prof_fk  FOREIGN KEY (codprof) REFERENCES professor (codprof);

CREATE TABLE matricula(
codaluno number(10) NOT NULL,
coddisc number(10) NOT NULL,
datamatricula date not null
);

ALTER TABLE matricula
ADD CONSTRAINT  matricula_pk  PRIMARY KEY (codaluno, coddisc);

ALTER TABLE matricula
ADD CONSTRAINT  matricula_aluno_fk  FOREIGN KEY (codaluno) REFERENCES aluno (codaluno);

ALTER TABLE matricula
ADD CONSTRAINT  matricula_disc_fk  FOREIGN KEY (coddisc) REFERENCES disciplina (coddisc);

------------------------------------------------------------------------------------------------------
--2.1
INSERT INTO aluno(1,'ANA','ana@gmail.com');
INSERT INTO aluno(2,'RAMIRO','ramiro@gmail.com');
INSERT INTO aluno(3,'MATHEUS','matheus@gmail.com');

INSERT INTO professor (1, 'PETRY');
INSERT INTO professor (2, 'EDER STONE');
INSERT INTO professor (3, 'PETER CHEN');

INSERT INTO disciplina(1,'BANCO DE DADOS',1);
INSERT INTO disciplina(2,'PROJETO DE SOFTWARE ORIENTADO A OBJETO',2);

insert into matricula (1,1,TO_DATE('12/10/2009', 'DD/MM/RRRR'));
insert into matricula (2,1, TO_DATE('05/04/2009', 'DD/MM/RRRR'));
insert into matricula (3,1,TO_DATE('05/04/2009', 'DD/MM/RRRR'));
insert into matricula (1,2,TO_DATE('12/10/2009', 'DD/MM/RRRR'));
insert into matricula (2,2, TO_DATE('05/04/2009', 'DD/MM/RRRR'));
insert into matricula (3,2,TO_DATE('05/04/2009', 'DD/MM/RRRR'));



SELECT a.nomealuno, d.nomedisc, p.nomeprof,  m.datamatricula
FROM matricula m, aluno a, disciplina d, professor p
where m.codaluno = a.codaluno
and m.coddisc = d.coddisc
and d.codprof = p.codprof
and to_char(datamatricula,'MM/RRRR') = '01/2009'
ORDER BY a.nomealuno, p.nomeprof ASC
