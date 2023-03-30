USE db_neoway24;

CREATE TABLE complemento (
    Cnpj_numeros bigint,
    razao_social varchar(100),
    matriz varchar(100),
    Dta_abertura  varchar(100),
    Descricao_cnae varchar(100),
    setor varchar(100),
    ramo_atividade varchar(100),
    numero_filiais varchar(100),
    numero_func varchar(100),
    faturamento_estimatimado varchar(100),
    PRIMARY KEY (Cnpj_numeros)
);