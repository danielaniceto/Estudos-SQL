# ==== INTENSIVÃO DE SQL ==== #
# =====      AULA 4      ====== #


# ======================== PARTE 1 ===========================#
#===============  CRIAÇÃO e CONFIGURAÇÃO DO BD ===============#
#=============================================================#

-- O primeiro passo é CRIAR e CONFIGURAR o banco de dados 'hashtagidiomas'.

create database idiomasmaster;
use idiomasmaster;


# ======================== PARTE 2 ===========================#
#===================  CRIAÇÃO DAS TABELAS ====================#
#=============================================================#

-- No nosso projeto, teremos que criar 3 tabelas: cursos, alunos e vendas.


/*
TABELA 1: cursos
•	id_curso
•	nome_curso
•	valor_curso
*/

create table cursos (
id_curso int,
nome_curso varchar(50),
valor_curso decimal(10,2)
);

select * from cursos;

/*
TABELA 2: alunos
•	id_aluno
•	nome_aluno
•	email
*/

create table alunos (
id_aluno int,
nome_aluno varchar(50),
email_aluno varchar(50)
);

select * from alunos;

/*
TABELA 3: vendas
•	id_venda
•	data_venda
•	id_curso
•	id_aluno
*/


create table vendas(
id_venda int,
data_vendar date,
id_curso int,
id_aluno int
);

select * from vendas;


# ======================== PARTE 3 ===========================#
#==============  ADICIONANDO VALORES NA TABELA ===============#
#=============================================================#

/*
TABELA 1: cursos

Adicione os valores abaixo na tabela de cursos

id_curso | nome_curso | valor_curso |
_____________________________________
1        | Inglês     | 1200        |
2        | Espanhol   | 1000        |
3        | Francês    | 900         |
*/
 
insert into cursos
values
	(1, 'Ingles', 1200),
    (2, 'Espanhol', 1000),
    (3, 'Frances', 900);

select * from cursos;

/*
TABELA 2: alunos

Adicione os valores abaixo na tabela de alunos

id_aluno | nome_aluno | email                  |
________________________________________________
1        | Eliane     | eliane@gmail.com       |
2        | João       | j.123@hotmail.com      |
3        | Pedro      | pedrinho@gmail.com    |
*/

insert into alunos
values
	(1, 'Eliane', 'eliane@gmail.com'),
    (2, 'João', 'j.123@hotmail.com'),
    (3, 'Pedro', 'pedrinho@gmail.com');

select * from alunos;

/*
TABELA 3: vendas

Adicione os valores abaixo na tabela de vendas

id_venda | data_venda      | id_curso  | id_aluno |
__________________________________________________
1        | '2022-01-10'    | 1         | 1        |
2        | '2022-01-10'    | 2         | 1        |
3        | '2022-01-10'    | 3         | 1        |
4        | '2022-01-13'    | 1         | 2        |
5        | '2022-01-21'    | 2         | 3        |
*/

INSERT INTO vendas
VALUES
	(1, '2022-01-10', 1, 1),
    (2, '2022-01-10', 2, 1),
    (3, '2022-01-10', 3, 1),
    (4, '2022-01-13', 1, 2),
    (5, '2022-01-21', 2, 3);

SELECT * FROM vendas;


# ======================== PARTE 4 ===========================#
#==============  ATUALIZANDO VALORES NA TABELA ===============#
#=============================================================#

-- O valor do curso de Francês será reajustado de R$900 para R$750. Atualize o valor na tabela de cursos.

 select * from cursos;
 
 update cursos
 set valor_curso = 750
 where id_curso = 3;
 
 select * from alunos;
 
 update alunos
 set email = 'eliane.audac@gmail.com'
 where id_aluno = 1;
 

# ======================== PARTE 5 ===========================#
#===============  EXCLUINDO VALORES DA TABELA ================#
#=============================================================#

-- Selecione a tabela de vendas. A compra do cliente 'Pedro' (id_venda = 5) foi reembolsada e por isso ela deve ser excluída do controle de vendas.

select * from vendas;

delete from vendas
where id_venda = 5;

# ======================== PARTE 5 ===========================#
#===========  EXCLUINDO TABELAS E BANCOS DE DADOS ============#
#=============================================================#

-- Exclua a tabela vendas e em seguida o banco de dados hashtagidiomas.

drop table cursos;
drop database hashtagidiomas;
