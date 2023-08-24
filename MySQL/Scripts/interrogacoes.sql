-- Seleção da base de dados
USE BelosTransportes;

-- 1. Para cada viagem deve ser calculada uma estimativa da quantidade de emissões de CO2 poupadas, através da sua distância
delimiter $$
CREATE PROCEDURE emissoesPoupadasPorViagem()
BEGIN
	SELECT Nr AS "Nº Viagem", fk_ParagemInicial AS "Origem", fk_ParagemFinal AS "Destino",
        ROUND(Distancia * 0.822, 2) AS "CO2 Poupado (Kg)"
		FROM Viagem
		ORDER BY ROUND(Distancia * 0.822, 2) DESC;
END $$

-- 2. O total de CO2 poupado por dia deve ser contabilizado pelo sistema
delimiter $$
CREATE PROCEDURE emissoesPoupadasPorDia()
BEGIN
	SELECT DATE(DataHora) AS "Dia", SUM(ROUND(Distancia * 0.822, 2)) AS "CO2 Poupado (Kg)" FROM Viagem
		GROUP BY Dia
        ORDER BY SUM(ROUND(Distancia * 0.822, 2)) DESC;
END $$

-- 3. O total de CO2 poupado na operação da empresa deve ser contabilizado pelo sistema
delimiter $$
CREATE PROCEDURE totalEmissoesPoupadas()
BEGIN
	SELECT SUM(ROUND(Distancia * 0.822, 2)) AS "Total CO2 Poupado (Kg)" FROM Viagem;
END $$

-- 4. As paragens com mais e menos percursos devem ser contabilizadas pelo sistema
delimiter $$
CREATE PROCEDURE nrPercursosPorParagem()
BEGIN
	SELECT fk_Paragem AS "ID Paragem", Paragem.Nome AS "Nome", Paragem.Cidade AS "Cidade",
		COUNT(fk_Percurso) AS "Nº Percursos"
		FROM PercursoParagem
		INNER JOIN Paragem ON fk_Paragem = Paragem.ID
		GROUP BY fk_Paragem
		ORDER BY "Nº Percursos" DESC;
END $$

-- 5. O sistema deve registar a quantidade de viagens efetuadas por cada passageiro
delimiter $$
CREATE PROCEDURE nrViagensPorPassageiro()
BEGIN
	SELECT fk_Passageiro AS "Passageiro", Passageiro.Nome AS "Nome", COUNT(Nr) AS "Viagens"
		FROM Viagem
        INNER JOIN Passageiro ON fk_Passageiro = Passageiro.ID
        GROUP BY fk_Passageiro
        ORDER BY fk_Passageiro;
END $$

-- 6. Deve ser registada a quantidade de viagens realizadas por cada motorista
delimiter $$
CREATE PROCEDURE nrViagensPorMotorista()
BEGIN
	SELECT fk_Motorista AS "Motorista", Motorista.Nome AS "Nome", COUNT(Nr) AS "Viagens"
		FROM Viagem
        INNER JOIN Motorista ON fk_Motorista = Motorista.ID
        GROUP BY fk_Motorista
        ORDER BY fk_Motorista;
END $$

-- 7. O total de viagens realizadas diariamente deve ser contabilizado pelo sistema
delimiter $$
CREATE PROCEDURE nrViagensPorDia()
BEGIN
	SELECT DATE(DataHora) AS "Dia", COUNT(Nr) AS "Viagens"
		FROM Viagem
        GROUP BY Dia
        ORDER BY Dia DESC;
END $$

-- 8. Para cada trajeto (Paragem Inicial -> Paragem Final), deverá ser contabilizada a quantidade de passageiros que o realizaram
delimiter $$
CREATE PROCEDURE nrPassageirosPorTrajeto()
BEGIN
	SELECT fk_ParagemInicial AS "Origem", fk_ParagemFinal AS "Destino",
		COUNT(DISTINCT fk_Passageiro) AS "Nº Passageiros"
		FROM Viagem
        GROUP BY CONCAT(fk_ParagemInicial, fk_ParagemFinal)
        ORDER BY "Nº Passageiros" DESC;
END $$

-- 9. Para cada percurso deve ser calculado o lucro obtido através da venda de bilhetes
delimiter $$
CREATE PROCEDURE lucroObtidoPorPercurso()
BEGIN
	SELECT Percurso.ID AS "Percurso", Percurso.Duracao AS "Duração", SUM(Custo) AS "Lucro Total (€)"
		FROM Viagem
        INNER JOIN Percurso ON fk_Percurso = Percurso.ID
        GROUP BY Percurso
        ORDER BY Percurso;
END $$

-- 10. Deve ser registado o número de autocarros que estiveram em operação numa determinada data
delimiter $$
CREATE PROCEDURE nrAutocarrosPorDia()
BEGIN
	SELECT DATE(DataHora) AS "Dia", COUNT(DISTINCT fk_Motorista) AS "Nº Autocarros em Operação"
		FROM Viagem
        GROUP BY Dia
        ORDER BY Dia DESC;
END

-- 11. O sistema deverá ser capaz de contabilizar o lucro total obtido pela venda de passes e bilhetes

delimiter $$
CREATE PROCEDURE lucroTotalBilhete()
BEGIN
	SELECT SUM(Custo) AS "Lucro Total Bilhetes (€)" FROM Viagem;
END $$

delimiter $$
CREATE PROCEDURE lucroTotalPasseMensal()
BEGIN
	SELECT SUM(Custo) AS "Lucro Total Passes Mensais (€/Mês)" FROM PasseMensal;
END $$
