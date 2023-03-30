CREATE DATABASE db_neoway24;

USE db_neoway24;

CREATE TABLE receita (
    Cnpj_numeros bigint,
    Cliente varchar(100),
    Valor varchar(100),
    Dta  varchar(100),
    tipo varchar(100),
    PRIMARY KEY (Cnpj_numeros)
);


