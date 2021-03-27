create database clube_do_livro;

use clube_do_livro;

create table aluno(
	matr_aluno int not null,
	rg_aluno char(9) not null,
	cidade_aluno varchar(30) default 'Curitiba', 
	nome_aluno varchar(80), 
	telefone_aluno int, 
	constraint un_rg_aluno unique(rg_aluno),
	constraint pk_aluno primary key(matr_aluno)
)engine=innodb;

create table area(
	cod_area int not null,
	nome_area varchar(80) not null,
	constraint pk_area primary key(cod_area)
)engine=innodb;

create table livro(
	cod_livro int not null,
	nome_livro varchar(80) not null,
	autor_livro varchar(80),
	cod_area int,
	matr_aluno int,
	constraint pk_livro primary key(cod_livro),
	constraint fk_livro_area foreign key(cod_area) references area(cod_area),
	constraint fk_livro_aluno foreign key(cod_livro) references aluno(matr_aluno)

	on delete cascade on update cascade
)engine=innodb;

create table emprestimo(
	data_emprestimo date,
	data_devolucao date,
	data_devolucao_prevista date,
	cod_aluno int not null,
	cod_livro int not null,
	constraint fk_emprestimo_aluno foreign key(cod_aluno) references aluno(matr_aluno),
	constraint fk_emprestimo_livro foreign key(cod_livro) references livro(cod_livro)
	
	on delete cascade on update cascade	
);

alter table aluno
add CPF_aluno varchar(11);

alter table aluno
modify CPF_aluno char(13);

alter table aluno
drop CPF_aluno;

-- Excluindo um constraint de uma chave estrangeira
alter table livro
drop foreign key fk_livro_aluno;

-- Adicionando uma constraint de chave estrangeira
alter table livro
add constraint fk_livro_aluno foreign key(matr_aluno) references aluno(matr_aluno);

-- Excluind um constraint unique
alter table aluno
drop index un_rg_aluno;

-- Adicionando constraint unique
alter table aluno
add constraint un_rg_aluno unique(rg_aluno);

-- Adicionando/alterando default
alter table aluno
alter column cidade_aluno set default 'Irati';

-- Excluind default
alter table aluno
alter column cidade_aluno drop default;

-- Alterando de null para not null
alter table aluno
modify nome_aluno varchar(50) null;

-- Alterando de not null para null
alter table aluno
modify nome_aluno varchar(50) not null;

-- Inserção de dados na tabela aluno
insert into aluno(matr_aluno, rg_aluno, nome_aluno, telefone_aluno, cidade_aluno)
values
(100, '12345678', 'Jemina', '12398756', 'cidade_tal'),
(101, '12397431', 'Felisberta', '97812342', 'cidade2'),
(102, '98762342', 'Juacinda', '129875432', 'cidade3');

-- Inserção de dados na tabela área
insert into area(cod_area, nome_area)
values
(1, 'Banco de Dados'),
(2, 'Engenharia de Software'),
(2, 'Modelagem de Sistemas'),
(1, 'Programação Orientada a Objetos'),
(2, 'Automação'),
(2, 'Trabalho de Conclusão de Curso');

SET FOREIGN_KEY_CHECKS=0;

-- Inserção de dados na tabela livros
insert into livro(cod_livro, nome_livro, autor_livro, matr_aluno, cod_area)
values
(1, 'Projeto de Banco de Dados', 'Heuser', 100, 1),
(2, 'Lógica de Programação', 'Forbellone', 101, 2),
(3, 'Romeu e Julieta', 'Shakespere', 102, 3),
(4, 'Chico Bento', 'Maurício', 100, 3),
(5, 'Mickey Mouse', 'Walt Disney', 102, 3),
(7, 'Java como Programar', 'Deitel', 200, 1),
(8, 'Curas Proíbidas', 'Andreas Kalcker', 778, 4),
(11, 'CDS a Cura é Possível', 'Andreas Kalcker', 777, 4),
(12, 'Sucesso não ocorre por acaso', 'Lair Ribeiro', 888, 4),
(15, 'Enrriquecer, ambição de muitos realização de poucos', 'Lair Ribeiro', 1000, 4);

-- Inserção de dados na table emprestimo
insert into emprestimo(cod_aluno, cod_livro, data_emprestimo, data_devolucao, data_devolucao_prevista)
values
(100, 2, '2021-01-10', '2021-01-15', '2021-01-15'),
(101, 1, '2021-02-15', '2021-02-20', '2021-02-20'),
(102, 2, '2021-03-20', '2021-04-25', '2021-03-25'),
(100, 5, '2021-04-25', '2021-06-30', '2021-04-30'),
(102, 1, '2021-05-01', '2021-06-06', '2021-05-06');
(100, 3, '2021-01-10', '2021-02-15', '2021-01-15'),
(101, 5, '2021-02-05', '2021-04-20', '2021-02-20'),
(102, 6, '2021-03-10', '2021-04-25', '2021-03-25'),
(100, 8, '2021-04-25', '2021-06-30', '2021-04-30'),
(102, 7, '2021-07-01', '2021-08-06', '2021-05-06');
