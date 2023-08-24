USE BelosTransportes;

INSERT INTO Passageiro (Nome, NIF, Rua, CodPostal, Localidade, Cidade, Contacto)
VALUES
    ('Maria Silva', 123456789, 'Rua das Flores', '4700-001', 'Braga', 'Braga', '912345678'),
    ('João Santos', 987654321, 'Rua da Liberdade', '4750-002', 'Barcelos', 'Barcelos', '919876543'),
    ('Ana Rodrigues', 456123789, 'Rua das Oliveiras', '4755-003', 'Vila Verde', 'Vila Verde', '915612378'),
    ('Pedro Costa', 789654123, 'Rua do Carmo', '4710-004', 'Guimarães', 'Guimarães', '917896541'),
    ('Sofia Pereira', 321789654, 'Avenida Central', '4730-005', 'Famalicão', 'Vila Nova de Famalicão', '913217896'),
    ('Manuel Fernandes', 654321987, 'Rua dos Lírios', '4760-006', 'Vila do Conde', 'Vila do Conde', '916543219'),
    ('Carolina Gonçalves', 987321654, 'Rua dos Cedros', '4740-007', 'Esposende', 'Esposende', '919873216'),
    ('Miguel Castro', 159753852, 'Rua do Progresso', '4790-008', 'Póvoa de Varzim', 'Póvoa de Varzim', '911597538'),
    ('Inês Ferreira', 852369741, 'Avenida da República', '4780-009', 'Braga', 'Braga', '918523697'),
    ('Rui Almeida', 369852147, 'Rua das Amendoeiras', '4750-010', 'Barcelos', 'Barcelos', '913698521');

INSERT INTO PasseMensal (Tipo, Custo, fk_Passageiro)
VALUES
    ('Urbano', 10.00, 1),
    ('Urbano', 10.00, 2),
    ('Urbano', 10.00, 3),
    ('Intermunicipal', 20.00, 4),
    ('Intermunicipal', 20.00, 5),
    ('Intermunicipal', 20.00, 6),
    ('Urbano', 10.00, 7),
    ('Urbano', 10.00, 8),
    ('Intermunicipal', 20.00, 9),
    ('Intermunicipal', 20.00, 10);

INSERT INTO Paragem (Nome, Rua, Localidade, Cidade, CodigoPostal, Latitude, Longitude)
VALUES
    ('Paragem da Praça', 'Rua da Praça', 'Braga', 'Braga', '4700-000', 41.551589, -8.422043),
    ('Paragem da Estação', 'Avenida da Estação', 'Barcelos', 'Barcelos', '4750-000', 41.536775, -8.615311),
    ('Paragem da Igreja', 'Largo da Igreja', 'Guimarães', 'Guimarães', '4810-000', 41.442726, -8.295013),
    ('Paragem do Mercado', 'Rua do Mercado', 'Famalicão', 'Vila Nova de Famalicão', '4760-000', 41.405344, -8.523235),
    ('Paragem do Jardim', 'Avenida do Jardim', 'Esposende', 'Esposende', '4740-000', 41.536911, -8.785393),
    ('Paragem do Hospital', 'Rua do Hospital', 'Barcelos', 'Barcelos', '4750-000', 41.537621, -8.623412),
    ('Paragem da Praia', 'Avenida da Praia', 'Póvoa de Varzim', 'Póvoa de Varzim', '4490-000', 41.380395, -8.761678),
    ('Paragem da Universidade', 'Avenida da Universidade', 'Braga', 'Braga', '4710-000', 41.557633, -8.406862),
    ('Paragem do Parque', 'Rua do Parque', 'Vila Nova de Famalicão', 'Vila Nova de Famalicão', '4760-000', 41.409877, -8.535789),
    ('Paragem do Estádio', 'Avenida do Estádio', 'Guimarães', 'Guimarães', '4810-000', 41.442158, -8.293543);

INSERT INTO Percurso (Duracao, Tipo)
VALUES
    ('00:45:00', 'Urbano'),
    ('01:15:00', 'Intermunicipal'),
    ('00:50:00', 'Urbano'),
    ('01:30:00', 'Intermunicipal'),
    ('00:55:00', 'Urbano'),
    ('01:45:00', 'Intermunicipal'),
    ('00:50:00', 'Urbano'),
    ('01:20:00', 'Intermunicipal'),
    ('00:40:00', 'Urbano'),
    ('01:40:00', 'Intermunicipal');

INSERT INTO PercursoParagem (fk_Paragem, fk_Percurso, Hora) VALUES
(1, 1, '09:00:00'),
(2, 1, '09:15:00'),
(3, 1, '09:30:00'),
(4, 2, '10:00:00'),
(5, 2, '10:15:00'),
(6, 2, '10:30:00'),
(7, 3, '11:00:00'),
(8, 3, '11:15:00'),
(9, 3, '11:30:00'),
(10, 4, '12:00:00'),
(1, 4, '12:15:00'),
(2, 4, '12:30:00'),
(3, 5, '13:00:00'),
(4, 5, '13:15:00'),
(5, 5, '13:30:00'),
(6, 6, '14:00:00'),
(7, 6, '14:15:00'),
(8, 6, '14:30:00'),
(9, 7, '15:00:00'),
(10, 7, '15:15:00');

INSERT INTO Motorista (Nome, NIF, Rua, Localidade, Cidade, CodigoPostal, Salario, IBAN)
VALUES
    ('João Silva', 123456789, 'Rua das Flores', 'Braga', 'Braga', '4700-001', 1500.00, 'PT50002700000001234567833'),
    ('Ana Santos', 987654321, 'Rua do Sol', 'Barcelos', 'Barcelos', '4750-123', 1350.50, 'PT50002700000009876543216'),
    ('Pedro Costa', 654789321, 'Rua Central', 'Vila Verde', 'Vila Verde', '4730-456', 1450.25, 'PT50002700000006547893214'),
    ('Sofia Pereira', 789654123, 'Avenida Principal', 'Esposende', 'Esposende', '4740-789', 1620.75, 'PT50002700000007896541239'),
    ('Miguel Ferreira', 321654987, 'Rua dos Pinheiros', 'Vila Nova de Famalicão', 'Vila Nova de Famalicão', '4760-234', 1400.50, 'PT50002700000003216549875'),
    ('Carla Almeida', 159753486, 'Rua das Oliveiras', 'Póvoa de Lanhoso', 'Póvoa de Lanhoso', '4830-567', 1550.00, 'PT50002700000001597534863'),
    ('Ricardo Neves', 456321789, 'Avenida da Liberdade', 'Guimarães', 'Guimarães', '4800-890', 1680.25, 'PT50002700000004563217892'),
    ('Inês Fernandes', 741258963, 'Rua das Rosas', 'Fafe', 'Fafe', '4820-123', 1320.75, 'PT50002700000007412589634'),
    ('Hugo Santos', 852963741, 'Rua dos Lírios', 'Cabeceiras de Basto', 'Cabeceiras de Basto', '4860-456', 1480.50, 'PT50002700000008529637419'),
    ('Teresa Carvalho', 369852147, 'Rua das Amendoeiras', 'Amares', 'Amares', '4720-789', 1575.50, 'PT50002700000003698521478');

INSERT INTO Autocarro (Marca, Matricula, Capacidade, Modelo, fk_Motorista)
VALUES
    ('Mercedes', 'AB1234', 30, 'Sprinter', 1),
    ('Volvo', 'CD5678', 40, 'B12M', 2),
    ('Scania', 'EF9012', 35, 'Irizar i6', 3),
    ('Iveco', 'GH3456', 25, 'Daily Tourys', 4),
    ('MAN', 'IJ7890', 50, 'Lions Coach', 5),
    ('Renault', 'KL2345', 45, 'Magnum', 6),
    ('Ford', 'MN6789', 30, 'Transit', 7),
    ('Fiat', 'OP0123', 35, 'Ducato', 8),
    ('Isuzu', 'QR3456', 40, 'Novo Touring', 9),
    ('Dacia', 'ST6789', 25, 'Dokker', 10);

INSERT INTO Viagem (DataHora, Duracao, Distancia, Custo, fk_Percurso, fk_Passageiro, fk_Motorista, fk_ParagemInicial, fk_ParagemFinal)
VALUES
    ('2023-06-01 09:15:00', '00:20:00', 10.5, 5.00, 1, 1, 1, 1, 2),
    ('2023-06-01 14:30:00', '00:25:00', 12.7, 5.50, 2, 2, 2, 3, 5),
    ('2023-06-01 18:45:00', '00:15:00', 8.2, 4.00, 3, 3, 3, 4, 7),
    ('2023-06-01 21:10:00', '00:30:00', 15.3, 6.50, 4, 4, 4, 5, 8),
    ('2023-06-02 08:00:00', '00:12:00', 7.5, 3.50, 5, 5, 5, 6, 10),
    ('2023-06-02 16:45:00', '00:18:00', 9.8, 4.50, 6, 6, 6, 7, 9),
    ('2023-06-02 19:20:00', '00:22:00', 11.4, 5.00, 7, 7, 7, 8, 3),
    ('2023-06-02 22:30:00', '00:26:00', 13.9, 6.00, 8, 8, 8, 9, 1),
    ('2023-06-03 09:50:00', '00:28:00', 14.7, 6.00, 9, 9, 9, 10, 6),
    ('2023-06-03 11:40:00', '00:14:00', 7.0, 3.00, 10, 10, 10, 1, 4),
    ('2023-06-03 14:20:00', '00:23:00', 11.8, 5.50, 1, 1, 2, 2, 7),
    ('2023-06-03 17:05:00', '00:17:00', 9.5, 4.50, 2, 2, 3, 3, 10),
    ('2023-06-03 18:30:00', '00:29:00', 14.4, 6.00, 3, 3, 4, 4, 5),
    ('2023-06-04 07:50:00', '00:13:00', 6.7, 3.00, 4, 4, 5, 5, 2),
    ('2023-06-04 16:20:00', '00:19:00', 9.2, 4.50, 5, 5, 6, 6, 3),
    ('2023-06-04 19:40:00', '00:21:00', 11.0, 5.00, 6, 6, 7, 7, 8),
    ('2023-06-04 22:10:00', '00:27:00', 13.6, 6.00, 7, 7, 8, 8, 1),
    ('2023-06-05 10:20:00', '00:25:00', 12.3, 5.50, 8, 8, 9, 9, 6),
    ('2023-06-05 12:35:00', '00:16:00', 8.7, 4.00, 9, 9, 10, 10, 4),
    ('2023-06-05 15:10:00', '00:22:00', 11.2, 5.00, 10, 10, 1, 1, 7);
