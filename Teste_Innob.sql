--  Campos Gerados - Colunas Calculadas...
create database Teste_Innob;

Use Teste_Innob;
create table tbl_mult(
	ID smallint primary key auto_increment,
	num1 smallint not null,
	num2 smallint not null,
	num3 smallint generated always as (num1 * num2) virtual
);

insert into tbl_mult(num1, num2) values (2, 1), (2, 2), (2, 3), (2, 4);
select * from tbl_mult;

update tbl_mult set num2 = 8 where ID = 2;

create table tbl_Vendas(
	ID_Venda smallint primary key auto_increment,
	Preco_Produto decimal(6,2) not null,
	Qtde tinyint not null,
	Desconto decimal(4,2) not null,
	Preco_Total decimal(6,2) as (Preco_Produto * Qtde * (1 - Desconto / 100)) stored
);

insert into tbl_Vendas (Preco_Produto, Qtde, Desconto) values (50.00, 2, 20), (65.00, 3, 15), (100, 1, 12), (132.00, 3, 18);

select * from tbl_Vendas;

-- ENUM - Tipo de Dado de Enumeração...
create table camisa(
	idCamisa tinyint primary key auto_increment,
	nome varchar(25),
	tamanho enum('pequeno', 'média', 'grande', 'extra-grande')
);

insert into camisa(nome, tamanho) values ('regata', 'grande');

select * from camisa;

insert into camisa(nome, tamanho) values ('social', 'médio');

insert into camisa(nome, tamanho) values ('social', 'média'), ('polo', 'pequena'), ('polo', 'grande'), ('camiseta', 'extra-grande');

select * from camisa;

-- Consultar os valores permissíveis para a coluna.....
show columns from camisa like 'tamanho';

-- Visualizar números de indices dos valores enumerados.....
select nome, tamanho + 0 from camisa;

-- Problemas com ORDER BY....
select * from camisa order by tamanho;

-- Resolvendo problemas com ORDER BY....
select * from camisa order by cast(tamanho as char);

-- Operador UNION - Unir dois ou mais resultados de consultas.....

-- Retornar nomes de livros e preços dos livros. Caso o preço do livro seja igual ou superior a R$ 60,00, mostrar a mensagem "Livro Caro" em uma coluna à direita no resultado da consulta.
-- Caso ao contrário, mostrar a mensagem "Preço Razoável" ordernado por preço, do mais barato para o mais caro....
-- Exemplo 01:
select Nome_Livro Livro, Preco_Livro Preco, 'Livro Caro' Resultado from tbl_Livros where Preco_Livro >= 60.00
union
select Nome_Livro Livro, Preco_Livro Preco, 'Livro Caro' Resultado from tbl_Livros where Preco_Livro < 60.00
order by Preco;

-- Exemplo 02:
-- Retornar nomes de Livros, preços e datas de publicação dos Livros. Caso a data de publicação seja anterior 1 15/04/2012, mostrar o preço acrescido de 15% em seu valor. Caso o livro custe mais de 65 reais, descontar 10% em seu valor.
select Nome_Livro Livro, Data_Pub 'Data de Publicação', Preco_Livro 'Preço Normal', Preco_Livro * 0.90 'Preço Ajustado' from tbl_Livros
where Preco_Livro > 65.00
union
select Nome_Livro Livro, Data_Pub 'Data de Publicação', Preco_Livro 'Preco Normal', Preco_Livro * 1.15 'Preço Ajustado' from tbl_Livros where Data_Pub < '20120415';