CREATE TABLE FUNCIONARIO
( pnome VARCHAR(15) NOT NULL,
minicial CHAR,
unome VARCHAR(15) NOT NULL,
cpf CHAR(9) NOT NULL,
data_nasc DATE,
endereco VARCHAR(30),
sexo CHAR,
salario DECIMAL(10,2),
cpf_supervisor CHAR(9),
Dnr INT NOT NULL DEFAULT 1,
PRIMARY KEY (cpf)
);

CREATE TABLE DEPARTAMENTO
( dnome VARCHAR(20) NOT NULL,
dnumero INT NOT NULL,
cpf_gerente CHAR(9) NOT NULL DEFAULT '888665555',
ger_data_ini DATE,
PRIMARY KEY (dnumero),
UNIQUE (dnome), -- Departamentos não podem ter o mesmo nome
FOREIGN KEY (cpf_gerente) REFERENCES FUNCIONARIO(cpf)
ON DELETE SET DEFAULT
ON UPDATE CASCADE );

ALTER TABLE FUNCIONARIO
ADD CONSTRAINT FKCONSTR1
FOREIGN KEY (cpf_supervisor) REFERENCES FUNCIONARIO(cpf)
ON DELETE SET NULL
ON UPDATE CASCADE;


CREATE TABLE LOCALIZACOES_DEP
( dnumero INT NOT NULL,
dlocalizacao VARCHAR(15) NOT NULL,
PRIMARY KEY (dnumero, dlocalizacao),
FOREIGN KEY (dnumero) REFERENCES DEPARTAMENTO(dnumero)
ON DELETE CASCADE
ON UPDATE CASCADE );

CREATE TABLE PROJETO
( 
pnome VARCHAR(20) NOT NULL,
pnumero INT NOT NULL,
plocalizacao VARCHAR(15),
dnum INT NOT NULL,
PRIMARY KEY (pnumero),
UNIQUE (pnome),
FOREIGN KEY (dnum) REFERENCES DEPARTAMENTO(dnumero) );

CREATE TABLE TRABALHA_EM
( fcpf CHAR(9) NOT NULL,
pnr INT NOT NULL,
Horas DECIMAL(3,1),
PRIMARY KEY (fcpf, pnr),
FOREIGN KEY (fcpf) REFERENCES FUNCIONARIO(cpf) 
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (pnr) REFERENCES PROJETO(pnumero)
ON DELETE CASCADE
ON UPDATE CASCADE);

CREATE TABLE DEPENDENTE
( fcpf CHAR(9) NOT NULL,
nome_dependente VARCHAR(15) NOT NULL,
sexo CHAR,
data_nasc DATE,
parentesco VARCHAR(8),
PRIMARY KEY (fcpf, Nome_dependente),
FOREIGN KEY (fcpf) REFERENCES FUNCIONARIO(cpf)
ON DELETE CASCADE
ON UPDATE CASCADE );


DELETE FROM FUNCIONARIO;
INSERT INTO FUNCIONARIO VALUES ('James', 'E', 'Borg',
  '888665555', '10-NOV-1927', '450 Stone, Houston,TX', 'M', 55000, 
  null, 1);
INSERT INTO FUNCIONARIO VALUES ('Franklin', 'T', 'Wong',
  '333445555', '08-DEC-1945', '638 Voss, Houston,TX', 'M', 40000, 
  '888665555', 5);

INSERT INTO FUNCIONARIO VALUES ('John', 'B', 'Smith',
  '123456789', '09-Jan-1955', '731 Fondren, Houston,TX', 'M', 30000, 
  '333445555', 5);
INSERT INTO FUNCIONARIO VALUES ('Jennifer', 'S', 'Wallace',
  '987654321', '20-JUN-1931', '291 Berry, Bellaire,TX', 'F', 43000, 
  '888665555', 4);

INSERT INTO FUNCIONARIO VALUES ('Alicia', 'J', 'Zelaya',
  '999887777', '19-JUL-1958', '3321 Castle, Spring,TX', 'F', 25000, 
  '987654321', 4);
INSERT INTO FUNCIONARIO VALUES ('Ramesh', 'K', 'Narayan',
  '666884444', '15-SEP-1952', '975 Fire Oak, Humble,TX', 'M', 38000, 
  '333445555', 5);
INSERT INTO FUNCIONARIO VALUES ('Joyce', 'A', 'English',
  '453453453', '31-JUL-1962', '5631 Rice, Houston, TX', 'F', 25000, 
  '333445555', 5);
INSERT INTO FUNCIONARIO VALUES ('Ahmad', 'V', 'Jabbar',
  '987987987', '29-MAR-1959', '980 Dallas, Houston,TX', 'M', 25000, 
  '987654321', 4);

DELETE FROM DEPARTAMENTO;
INSERT INTO DEPARTAMENTO VALUES ('Pesquisa', 5, '333445555', '22-MAY-78');
INSERT INTO DEPARTAMENTO VALUES ('Administração', 4, '987654321', '01-JAN-85');
INSERT INTO DEPARTAMENTO VALUES ('Sede administrativa', 1, '888665555', '19-JUN-71');

DELETE FROM PROJETO;
INSERT INTO PROJETO VALUES ('ProductX', 1, 'Bellaire',  5);
INSERT INTO PROJETO VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO PROJETO VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO PROJETO VALUES ('Automatização', 10, 'Stafford', 4);
INSERT INTO PROJETO VALUES ('Reorganização', 20, 'Houston', 1);
INSERT INTO PROJETO VALUES ('Novos Benefícios', 30,  'Stafford', 4);

DELETE FROM LOCALIZACOES_DEP;
INSERT INTO LOCALIZACOES_DEP VALUES (1, 'Houston');
INSERT INTO LOCALIZACOES_DEP VALUES (4, 'Stafford');
INSERT INTO LOCALIZACOES_DEP VALUES (5, 'Bellaire');
INSERT INTO LOCALIZACOES_DEP VALUES (5, 'Sugarland');
INSERT INTO LOCALIZACOES_DEP VALUES (5, 'Houston');

DELETE from DEPENDENTE;
INSERT INTO DEPENDENTE VALUES ('333445555','Alice','F','05-APR-1976','Daughter');
INSERT INTO DEPENDENTE VALUES ('333445555','Theodore','M','25-OCT-1973','Son');
INSERT INTO DEPENDENTE VALUES ('333445555','Joy','F','03-MAY-1948','Spouse');
INSERT INTO DEPENDENTE VALUES ('987654321','Abner','M','29-FEB-1932','Spouse');
INSERT INTO DEPENDENTE VALUES ('123456789','Michael','M','01-JAN-1978','Son');
INSERT INTO DEPENDENTE VALUES ('123456789','Alice','F', '31-DEC-1978','Daughter');
INSERT INTO DEPENDENTE VALUES ('123456789','Elizabeth','F','05-MAY-1957','Spouse');

DELETE FROM TRABALHA_EM;
INSERT INTO TRABALHA_EM VALUES ('123456789', 1,  32.5);
INSERT INTO TRABALHA_EM VALUES ('123456789', 2,  7.5);
INSERT INTO TRABALHA_EM VALUES ('666884444', 3,  40.0);
INSERT INTO TRABALHA_EM VALUES ('453453453', 1,  20.0);
INSERT INTO TRABALHA_EM VALUES ('453453453', 2,  20.0);
INSERT INTO TRABALHA_EM VALUES ('333445555', 2,  10.0);
INSERT INTO TRABALHA_EM VALUES ('333445555', 3,  10.0);
INSERT INTO TRABALHA_EM VALUES ('333445555', 10, 10.0);
INSERT INTO TRABALHA_EM VALUES ('333445555', 20, 10.0);
INSERT INTO TRABALHA_EM VALUES ('999887777', 30, 30.0);
INSERT INTO TRABALHA_EM VALUES ('999887777', 10, 10.0);
INSERT INTO TRABALHA_EM VALUES ('987987987', 10, 35.0);
INSERT INTO TRABALHA_EM VALUES ('987987987', 30, 5.0);
INSERT INTO TRABALHA_EM VALUES ('987654321', 30, 20.0);
INSERT INTO TRABALHA_EM VALUES ('987654321', 20, 15.0);
INSERT INTO TRABALHA_EM VALUES ('888665555', 20, NULL);
