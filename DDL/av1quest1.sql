-- Questão 1-A 1-B
CREATE TABLE TERRENO   (
  IDCONDOMINIO INT4 NOT NULL,
  IDTERRENO SERIAL PRIMARY KEY,
  PROPRIETARIO VARCHAR(200) NOT NULL,
  SITUACAO VARCHAR(20) NOT NULL,
  VALOR NUMERIC(15,2) NOT NULL
);

CREATE TABLE CONDOMINIO   (
  IDCONDOMINIO INT4 PRIMARY KEY,
  CONSTRUTORA VARCHAR(200) NOT NULL,
  DATA_CRIA DATE NOT NULL
);
-- Questão 1-C 
ALTER TABLE TERRENO ADD CONSTRAINT fk_condominio_terreno FOREIGN KEY (IDCONDOMINIO) REFERENCES CONDOMINIO (IDCONDOMINIO);
-- Questão 1-D
ALTER TABLE TERRENO ADD CONSTRAINT vf_situacao_terreno CHECK (SITUACAO IN ('Disponível', 'Vendido'));
-- Questão 2-A
ALTER TABLE CONDOMINIO ADD COLUMN ENDERECO VARCHAR(200) NOT NULL;
ALTER TABLE CONDOMINIO ADD COLUMN BAIRRO VARCHAR(200) NOT NULL;
ALTER TABLE CONDOMINIO ADD COLUMN CIDADE VARCHAR(200) NOT NULL;
-- Questão 2-B
ALTER TABLE TERRENO ADD COLUMN IDENTIFICACAO VARCHAR(100) NOT NULL;
-- Questão 3-A
INSERT INTO CONDOMINIO (IDCONDOMINIO, CONSTRUTORA, DATA_CRIA, ENDERECO, BAIRRO, CIDADE)
VALUES ('100', 'Construtora Carlessi', '2024-04-02', 'Rua Centenario, nº 500', 'Bairro Universitário', 'Cidade Criciuma');
-- Questão 3-B
INSERT INTO TERRENO (IDCONDOMINIO, IDTERRENO, PROPRIETARIO, SITUACAO, VALOR, IDENTIFICACAO)
VALUES ('100', '101', 'Construtora Carlessi', 'Disponível', 440000.00, '789012'),
       ('100', '102', 'Construtora Carlessi', 'Disponível', 602000.00, '789012'),
       ('100', '103', 'Construtora Carlessi', 'Disponível', 601000.00, '789012');
-- Questão 3-A
INSERT INTO CONDOMINIO (IDCONDOMINIO, CONSTRUTORA, DATA_CRIA, ENDERECO, BAIRRO, CIDADE)
VALUES ('200', 'Construtora Corbeta', '2020-02-01', 'Rua Universitaria, nº 456', 'Bairro Universitario', 'Cidade Criciuma');
-- Questão 3-C      
INSERT INTO TERRENO (IDCONDOMINIO, IDTERRENO, PROPRIETARIO, SITUACAO, VALOR, IDENTIFICACAO)
VALUES ('200', '201', 'Construtora Corbeta', 'Disponível', 83000.00, '789012'),
       ('200', '202', 'Construtora Corbeta', 'Disponível', 50000.00, '789012');
-- Questão 3-D  
DELETE FROM TERRENO WHERE IDENTIFICACAO = 'LT103';
-- Questão 3-E
UPDATE TERRENO SET SITUACAO = 'Vendido' WHERE IDENTIFICACAO = 'LT201';
-- Questão 4-A      
SELECT 
  c.CONSTRUTORA AS construtora, c.DATA_CRIA AS data_criacao, c.BAIRRO AS bairro, t.IDENTIFICACAO AS identificacao_terra, t.PROPRIETARIO AS proprietario_terra, t.SITUACAO AS situacao_terra, t.VALOR AS valor_terra
FROM TERRENO t JOIN CONDOMINIO c ON t.IDCONDOMINIO = c.IDCONDOMINIO;
-- Questão 4-B
SELECT 
  c.CONSTRUTORA AS CONDOMÍNIO, COUNT(t.IDTERRENO) AS QUANTIDADE_TERRENOS, SUM(t.VALOR) AS VALOR_TOTAL_TERRENOS
FROM  CONDOMINIO c JOIN TERRENO t ON c.IDCONDOMINIO = t.IDCONDOMINIO GROUP BY c.CONSTRUTORA;
-- Questão 4-C
SELECT * FROM TERRENO t JOIN CONDOMINIO c ON t.IDCONDOMINIO = c.IDCONDOMINIO WHERE c.IDCONDOMINIO = 1;

      