CREATE DATABASE db_recommendations_system;

USE db_recommendations_system;

CREATE TABLE openfinance_produtos
(
	id_produto int auto_increment primary key,
    tipo_investimento varchar(255),
    risco varchar(255),
    descricao varchar(255)
);

CREATE TABLE openfinance_bancos
(
	id_banco int auto_increment primary key,
    descricao varchar(255),
    codigo varchar(10)
);

CREATE TABLE quantumfinance_clientes
(
    id_cliente int auto_increment primary key,
    customer_name varchar(255),
    state varchar(255),
    age int,
    gender char(2),
    salary decimal(18,2),
    total_invested decimal(18,2)
);

CREATE TABLE quantumfinance_cliente_produto
(
    id_cliente int primary key,
    id_banco int,
    id_produto int
);

CREATE VIEW vw_cliente_produto AS
SELECT DISTINCT cli.id_cliente, cli.customer_name, pro.id_produto, pro.tipo_investimento
FROM quantumfinance_cliente_produto clipro
INNER JOIN quantumfinance_clientes cli ON cli.id_cliente = clipro.id_cliente
INNER JOIN openfinance_produtos pro ON pro.id_produto = clipro.id_produto;