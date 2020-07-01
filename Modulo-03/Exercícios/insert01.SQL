INSERT INTO mydb.pais (idPais, nome_pais)
VALUES (1, 'Brasil');

SELECT * FROM mydb.pais;

INSERT INTO mydb.pais (nome_pais)
VALUES ('EUA');

SELECT * FROM mydb.pais;

INSERT INTO mydb.pais (nome_pais)
VALUES ('Chile'), ('Argentina'), ('Uruguai');

SELECT * FROM mydb.pais;

UPDATE mydb.pais
SET
nome_pais = 'Estados Unidos'
WHERE idPais = 2;

SELECT * FROM mydb.pais;

DELETE FROM mydb.pais WHERE idPais = 4;

SELECT * FROM mydb.pais;