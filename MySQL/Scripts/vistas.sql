-- Seleção da base de dados
USE BelosTransportes;

CREATE VIEW verPassageiros AS
	SELECT ID FROM Passageiro;
        
CREATE VIEW verPassesMensais AS
	SELECT PasseMensal.ID AS "Nº Passe", Tipo, Custo AS "Custo (€)",
		Nome AS "Passageiro", Localidade, Cidade
		FROM PasseMensal
        INNER JOIN Passageiro ON fk_Passageiro = Passageiro.ID;
        
CREATE VIEW verParagens AS
	SELECT Paragem.ID AS "Paragem", Nome, Cidade,
		Percurso.ID AS "Percurso", Hora
        FROM PercursoParagem
        INNER JOIN Paragem ON fk_Paragem = Paragem.ID
        INNER JOIN Percurso ON fk_Percurso = Percurso.ID;
    
CREATE VIEW verPercursos AS
	SELECT Percurso.ID AS "Percurso", Duracao, Tipo,
		Nome AS "Paragem", Hora
        FROM PercursoParagem
        INNER JOIN Percurso ON fk_Percurso = Percurso.ID
        INNER JOIN Paragem ON fk_Paragem = Paragem.ID;

CREATE VIEW verMotoristas AS
	SELECT Motorista.ID, Nome, Cidade, Salario AS "Salário (€)",
		Autocarro.Matricula AS "Autocarro", Marca, Modelo
        FROM Motorista
        LEFT JOIN Autocarro ON Autocarro.fk_Motorista = Motorista.ID;
        
CREATE VIEW verAutocarros AS
	SELECT Autocarro.ID, Matricula, Marca, Modelo,
		Nome AS "Motorista", Cidade
        FROM Autocarro
        INNER JOIN Motorista ON fk_Motorista = Motorista.ID;
        
CREATE VIEW verViagens AS
	SELECT Nr, DataHora, Duracao, Distancia AS "Distancia (Km)", Custo AS "Custo (€)",
		fk_Percurso AS "Percurso", fk_Passageiro AS "Passageiro",
        PI.Nome AS "Origem", PF.Nome AS "Destino", Motorista.Nome AS "Motorista"
        FROM Viagem
        INNER JOIN Paragem AS PI ON fk_ParagemInicial = PI.ID
        INNER JOIN Paragem AS PF ON fk_ParagemFinal = PF.ID
        INNER JOIN Motorista ON fk_Motorista = Motorista.ID;
		