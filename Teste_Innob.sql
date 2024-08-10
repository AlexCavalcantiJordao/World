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