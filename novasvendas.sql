USE db_neoway24;

CREATE TABLE novas_vendas (
    Cnpj_numeros bigint,
    Cliente varchar(100),
    Valor varchar(100),
    Dta  varchar(100),
    tipo varchar(100),
    PRIMARY KEY (Cnpj_numeros)
);