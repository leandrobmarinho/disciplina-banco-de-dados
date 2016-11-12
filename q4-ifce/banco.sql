create table aluno(
	matricula	int NOT NULL,
	nome		varchar(20) NOT NULL,
	rua			varchar(200)  NOT NULL,
	num			varchar(8)  NOT NULL,
	cidade		varchar(30)  NOT NULL,
	estado		varchar(20)  NOT NULL,
	primary key (matricula)
);

create table disciplina(
	codigo		int NOT NULL,
	nome		varchar(50) NOT NULL,
	cont_prog	varchar(200) NOT NULL,
	carga_hor	INT NOT NULL,
	primary key (codigo)
);


create table telefone(
	matricula 	int NOT NULL,
	telefone	VARCHAR(11) NOT NULL,
	PRIMARY KEY (matricula, telefone),
	FOREIGN KEY (matricula) REFERENCES aluno(matricula)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

create table aluno_disciplina(
	matricula	int NOT NULL,
	cod_disc	int	NOT NULL,
	FOREIGN KEY (matricula) REFERENCES aluno(matricula)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (cod_disc) REFERENCES disciplina(codigo)
	ON DELETE CASCADE
	ON UPDATE CASCADE,,
);