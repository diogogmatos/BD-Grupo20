-- Criação da base de dados
CREATE SCHEMA BelosTransportes;

-- Seleção da base de dados
USE BelosTransportes;

/* Criação de Tabelas */

CREATE TABLE Passageiro (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
    NIF INT,
    Rua VARCHAR(100),
    CodPostal VARCHAR(8),
    Localidade VARCHAR(50),
    Cidade VARCHAR(30),
    Contacto VARCHAR(20)
);

CREATE TABLE PasseMensal (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Tipo ENUM ('Urbano', 'Intermunicipal') NOT NULL,
    Custo DECIMAL(4,2) NOT NULL,
    fk_Passageiro INT NOT NULL,
    FOREIGN KEY (fk_Passageiro)
		REFERENCES Passageiro (ID)
);

CREATE TABLE Paragem (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Rua VARCHAR(100) NOT NULL,
    Localidade VARCHAR(50) NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    CodigoPostal VARCHAR(8) NOT NULL,
    Latitude DECIMAL(9,6) NOT NULL,
    Longitude DECIMAL(9,6) NOT NULL
);

CREATE TABLE Percurso (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Duracao TIME NOT NULL,
    Tipo ENUM ('Urbano', 'Intermunicipal') NOT NULL
);

CREATE TABLE PercursoParagem (
    fk_Paragem INT NOT NULL,
    fk_Percurso INT NOT NULL,
    Hora TIME NOT NULL,
    FOREIGN KEY (fk_Paragem)
		REFERENCES Paragem (ID),
	FOREIGN KEY (fk_Percurso)
		REFERENCES Percurso (ID)
);

CREATE TABLE Motorista (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    NIF INT NOT NULL,
    Rua VARCHAR(100) NOT NULL,
    Localidade VARCHAR(50) NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    CodigoPostal VARCHAR(8) NOT NULL,
    Salario DECIMAL(6,2) NOT NULL,
    IBAN VARCHAR(34) NOT NULL
);

CREATE TABLE Autocarro (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Marca VARCHAR(30) NOT NULL,
    Matricula VARCHAR(6) NOT NULL,
    Capacidade INT NOT NULL,
    Modelo VARCHAR(30) NOT NULL,
    fk_Motorista INT NOT NULL,
    FOREIGN KEY (fk_Motorista)
		REFERENCES Motorista (ID)
);

CREATE TABLE Viagem (
    Nr INT AUTO_INCREMENT PRIMARY KEY,
    DataHora DATETIME NOT NULL,
    Duracao TIME NOT NULL,
    Distancia DECIMAL(5,2) NOT NULL,
    Custo DECIMAL(4,2) NOT NULL,
    fk_Percurso INT NOT NULL,
    fk_Passageiro INT NOT NULL,
    fk_Motorista INT NOT NULL,
    fk_ParagemInicial INT NOT NULL,
    fk_ParagemFinal INT NOT NULL,
    FOREIGN KEY (fk_Percurso)
		REFERENCES Percurso (ID),
	FOREIGN KEY (fk_Passageiro)
		REFERENCES Passageiro (ID),
	FOREIGN KEY (fk_Motorista)
		REFERENCES Motorista (ID),
	FOREIGN KEY (fk_ParagemInicial)
		REFERENCES Paragem (ID),
	FOREIGN KEY (fk_ParagemFinal)
		REFERENCES Paragem (ID)
);
