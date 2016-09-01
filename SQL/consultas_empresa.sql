-- C0: Obtenha a data de nascimento e o endereço do(s) funcionário(s) cujo 
--- nome seja `John B Smith'.
SELECT	data_nasc, endereco
FROM	FUNCIONARIO
WHERE	Pnome = 'John'
AND	Minicial = 'B'
AND	Unome = 'Smith'




-- C1: Obtenha o nome e endereço de todos os empregados que trabalham para o 
-- departamento de `Pesquisa'.
SELECT	pnome, unome, endereco
FROM 	departamento, funcionario
WHERE	dnumero = dnr
AND	dnome = 'Pesquisa'




-- Apelido
SELECT pnome, unome
FROM	funcionario AS f, dependente AS d
WHERE	f.cpf = d.fcpf
AND	d.sexo = 'M'




-- Falta do WHERE
SELECT cpf
FROM	funcionario

SELECT cpf
FROM	funcionario, departamento




-- Asterisco (*)
SELECT *
FROM	funcionario
WHERE	dnr = 5




-- ALL e DISTINCT
SELECT ALL salario
FROM funcionario

SELECT DISTINCT salario
FROM funcionario


-- Obter o cpf dos empregados do departamento 5 e do seus supervisores.
(SELECT cpf
FROM	funcionario
WHERE	dnr = 5)
UNION
(SELECT cpf_supervisor
FROM	funcionario
WHERE	dnr = 5)




-- LIKE
SELECT pnome, unome, endereco
FROM	funcionario
WHERE	endereco LIKE '%Houston%'




-- ORDER BY
SELECT pnome, unome, salario
FROM	funcionario
WHERE	dnr = 5
ORDER BY	salario



-- INSERT, DELETE, UPDATE
INSERT INTO projeto VALUES ('ProductA', 6, 'Umirim',  5);

DELETE FROM DEPENDENTE
WHERE nome_dependente = 'Alice';

UPDATE projeto
SET plocalizacao = 'Stafford', dnum = 5
WHERE pnumero = 10;
