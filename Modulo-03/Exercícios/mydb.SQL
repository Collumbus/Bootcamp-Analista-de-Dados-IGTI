CREATE DATABASE mydb;

-- -------------------------------------------
-- Table mydb.Pais
-- -------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Pais(
	idPais INT NOT NULL AUTO_INCREMENT,
	nome_pais VARCHAR(150) NOT NULL,
	PRIMARY KEY (idPais))
;

-- -------------------------------------------
-- Table mydb.Cliente
-- -------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Cliente(
	idCliente INT NOT NULL AUTO_INCREMENT,
	nome_cliente VARCHAR(255) NOT NULL,
	data_Nasc DATE NULL,
	idPais INT NOT NULL,
	PRIMARY KEY (idCliente),
	INDEX fk_Cliente_Pais_idx (idPais ASC) VISIBLE,
	CONSTRAINT fk_Cliente_Pais
		FOREIGN KEY (idPais)
		REFERENCES mydb.Pais (idPais)
		ON DELETE RESTRICT
		ON UPDATE CASCADE)
;

ALTER TABLE mydb.Cliente
	ADD COLUMN endereco VARCHAR(255);