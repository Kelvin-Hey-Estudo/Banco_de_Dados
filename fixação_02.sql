--> I - Exiba o nome do cliente e o total da multa de todos os clientes que tem a sílaba "on" em seu nome

select 
nome_cliente, 
valor_multa_emprestimo 
from 
tbcliente, 
tbemprestimo
where 
nome_cliente like "%on%"; 

--> II - Quantos empréstimos foram efetuados pelo cliente Cullen Pucket?

select 
nome_cliente, 
data_emprestimo
from 
tbcliente, 
tbemprestimo
where 
nome_cliente like 'Cullen Puck%';

--> III - Qual o total das multas nos emprestimos do cliente Cullen Pucket?

select 
nome_cliente, 
valor_multa_emprestimo
from 
tbcliente, 
tbemprestimo 
where 
nome_cliente like 'Cullen Puck%';

--> IV - Realize a média das multas de todas as pessoas 
--> que possuem a letra b como inicial de seu nome

select 
avg(valor_multa_emprestimo)
from 
tbemprestimo, 
tbcliente
where 
tbcliente.nome_cliente like 'b%';

--> V - Exiba o valor da menor multa, maior multa, quantidade de multas, 
--> somatório de multas e valor medio de multas em uma mesma consulta

select 
min(valor_multa_emprestimo), 
max(valor_multa_emprestimo), 
count(valor_multa_emprestimo), 
sum(valor_multa_emprestimo), 
avg(valor_multa_emprestimo)
from 
tbemprestimo;


-------------------------------------------------------------------

-- Alias
-- 1. Alteração do nome de coluna
select tbClasse.nome_classe as 'Nome da Classe',
tbClasse.preco_classe * 1.05 as 'Preço com aumento de 5%'
from tbClasse;

-- 2. Colocando Alias em tabelas
select C.nome_cliente from tbCliente as C;

-- 3. Usando Alias com Inner Join
-- Exiba o nome do titulo e o noem da categoria dos titulos do ano de 2015
select T.nome_titulo, C.nome_categoria from tbTitulo T
inner join tbCategoria C on T.cod_categoria=C.cod_categoria
where T.ano_titulo = 2015;

-- Like
-- 1. Consulta que retona todos os titulos iniciados com a letra N
selec T.nome as 'Nome do Titulo', T.ano_titulo as 'Ano'
from tbTitulo T
where T.nome_titulo like "M%";

-- 2. Consulta que retorna todos os titulos com a substring am
select T.nome_titulo from tbTitulo T
where T.nome_titulo like "%am%";

-- 3. Consulta que retorna titulos finalizados em a
select T.nome_titulo
from tbTitulo T
where T.nome_titulo like '%a';

-- 4. Consulta que retorna todos os titulos com 5 caracteres
select T.nome_titulo from tbTitulo T
where T.nome_titulo like '_____';

-- 5. Consulta que retorna todos os titulos com 5 caracteres iniciados em a e finalizados em t
select T.nome_titulo from tbTitulo T
where T.nome_titulo like 'a__t';

-- 6. Consulta que retorna todos os titulos que não contem a substring am
select T.nome_titulo
from tbTitulo T
where T.nome_titulo not like '%am%';

-- Order by
-- 1.
select T.nome_titulo, T.ano_titulo rom tbTitulo T
order by T.nome_titulo asc, T.ano_titulo desc;

-- 2.
select C.nome_cliente as 'Nome do Cliente', C.data_cadastro_cliente as 'Data do Cadastro'
from tbCliente C
order by C.data_cadastro_cliente asc;

-- Funções Agregadas
-- AVG
-- 1. Consulta que Retorna o preço medio dos preços da classe da tbClasse
select AVG(C.preco_classe) as "MEDIA" from tbClasse C;

-- SUM
-- 2. Consulta que retorna o somatorio de multas de todos os empréstimos
select sum(E.valor_multa_emprestimo) as "somatorio de multas"
from tbemprestimo E;

-- MIN
-- 3 . Consulta para retornar o cadastro do cliente mais antigo
select min(C.data_cadastro_cliente) as "cadastro do cliente mais antigo"
from tbCliente C;

-- MAX
-- 4. MAX Consulta para retornar o cadastro do clinte mas recente
select max(C.data_cadastro_cliente) as "cadastro do cliente mais recente"
from tbCliente C;

-- COUNT
-- 5. Retorne a quantidade de Filmes
select count(*)
from tbFilmes;

-- 6. Retorna a quantidade de titulos de uma determinda categoria, por exemplo terro
select count(T.cod_titulo) as "Quantidade de filimes de Terror"
from tbTitulo T
inner join tbCategoria C on T.cod_categoria = C.cod_categoria
where C.nome_categoria like "Terro";
