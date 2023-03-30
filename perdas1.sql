USE db_neoway24;

CREATE TABLE perdas1 (
    Cnpj_numeros bigint,
    Cliente varchar(100),
    Valor varchar(100),
    Dta  varchar(100),
    tipo varchar(100),
    nao_informardo varchar(100),
    nao_aplica1 varchar(100),
    nao_aplica2 varchar(100),
    PRIMARY KEY (Cnpj_numeros)
);

SELECT COUNT(DISTINCT Cliente) AS total_cliente_novas_vendas FROM novas_vendas;

SELECT COUNT(DISTINCT Cliente) AS total_cliente_receita FROM receita;

SELECT COUNT(DISTINCT Cliente) AS total_cliente_perdas FROM perdas1;

SELECT COUNT(DISTINCT razao_social) AS total_razoessociais FROM complemento;


SELECT * FROM
(
    SELECT Cnpj_numeros, Cliente, Valor, Dta , tipo FROM receita
    UNION
    SELECT Cnpj_numeros, Cliente, Valor, Dta , tipo FROM novas_vendas
    UNION
    SELECT Cnpj_numeros, Cliente, Valor, Dta , tipo FROM perdas1
) temp
ORDER BY Cliente asc ;

SELECT sum(cast(replace(replace(Valor, '.', ''), ',', '.') as decimal(10,2))) AS valortotal_recorrente
FROM receita WHERE  (Dta >= "01-01-2023" and Dta <= "31-12-2023") and tipo = "Recorrente";

SELECT sum(cast(replace(replace(Valor, '.', ''), ',', '.') as decimal(10,2))) AS valortotal_new
FROM novas_vendas WHERE  (Dta >= "01-01-2023" and Dta <= "31-12-2023") and tipo = "NEW";

SELECT sum(cast(replace(replace(Valor, '.', ''), ',', '.') as decimal(10,2))) AS valortotal_upsell
FROM novas_vendas WHERE  (Dta >= "01-01-2023" and Dta <= "31-12-2023") and tipo = "Upsell";

SELECT sum(cast(replace(replace(Valor, '.', ''), ',', '.') as decimal(10,2))) AS valortotal_downsell
FROM perdas1 WHERE  (Dta >= "01-01-2023" and Dta <= "31-12-2023") and tipo = "Downsell" ;

SELECT sum(cast(replace(replace(Valor, '.', ''), ',', '.') as decimal(10,2))) AS valortotal_churn
FROM perdas1 WHERE  (Dta >= "01-01-2023" and Dta <= "31-12-2023") and tipo = "Churn" ;

SELECT * FROM novas_vendas WHERE  (Dta >= "01-01-2023" and Dta <= "30-03-2023") and (tipo = "New") ORDER BY valor LIMIT 10  ;



ALTER TABLE receita 
ADD nivel_atividade VARCHAR(100) NULL;

ALTER TABLE receita
ADD cnae_nome VARCHAR(100) NULL;

SELECT * FROM receita Order by Cliente;

ALTER TABLE novas_vendas
ADD nivel_atividade VARCHAR(100) NULL;

ALTER TABLE novas_vendas
ADD cnae_nome VARCHAR(100) NULL;

SELECT * FROM novas_vendas Order by Cliente;

ALTER TABLE perdas1
ADD nivel_atividade VARCHAR(100) NULL;

ALTER TABLE perdas1
ADD cnae_nome VARCHAR(100) NULL;

SELECT * FROM perdas1 Order by Cliente;

ALTER TABLE complemento
ADD coluna_vazia VARCHAR(100) NULL;

ALTER TABLE complemento DROP COLUMN coluna_vazia;

SELECT * FROM complemento Order by razao_social;