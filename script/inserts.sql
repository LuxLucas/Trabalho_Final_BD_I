INSERT INTO [Banco] ([nm], [cnpj]) VALUES 
('Banco do Brasil', '00000000000191'),
('Caixa Econômica Federal', '00000000000272'),
('Itaú Unibanco', '00000000000353'),
('Bradesco', '00000000000434'),
('Santander', '00000000000515'),
('Banco Safra', '00000000000696'),
('Banco do Nordeste', '00000000000777');


INSERT INTO [Aluno] ([nm], [cpf], [email], [dt_nasc]) VALUES 
('João Silva', '12345678901', 'joao.silva@email.com', '2000-01-01'),
('Maria Oliveira', '23456789012', 'maria.oliveira@email.com', '1999-02-02'),
('Carlos Santos', '34567890123', 'carlos.santos@email.com', '1998-03-03'),
('Ana Costa', '45678901234', 'ana.costa@email.com', '1997-04-04'),
('Paulo Pereira', '56789012345', 'paulo.pereira@email.com', '1996-05-05'),
('Fernanda Lima', '67890123456', 'fernanda.lima@email.com', '1995-06-06'),
('Ricardo Souza', '78901234567', 'ricardo.souza@email.com', '1994-07-07'),

/*1. Alunos com matrícula inativa com parcelas pendentes*/
('Eduardo Teixeira Da Rosa', '56789012336', 'eduardo.rosa@email.com', '1989-04-01'), /*8*/
('Samara Constante Dos Santos', '98341012336', 'eduardo.rosa@email.com', '1989-04-01'); /*9*/


INSERT INTO [Estado] ([uf]) VALUES 
('SP'),
('RJ'),
('MG'),
('BA'),
('PR'),
('CE'),
('SC');


INSERT INTO [Cidade] ([nm], [id_estado]) VALUES 
('São Paulo', 1),
('Rio de Janeiro', 2),
('Belo Horizonte', 3),
('Salvador', 4),
('Curitiba', 5),
('Fortaleza', 6),
('Florianópolis', 7),
('Criciúma', 7);


INSERT INTO [Endereco] ([id_aluno], [id_cidade], [bairro], [logradouro]) VALUES 
(1, 1, 'Centro', 'Rua A'),
(2, 2, 'Zona Sul', 'Avenida B'),
(3, 3, 'Centro', 'Rua C'),
(4, 4, 'Barra', 'Avenida D'),
(5, 5, 'Centro', 'Rua E'),
(6, 6, 'Aldeota', 'Rua F'),
(7, 7, 'Centro', 'Rua G'),

/*1. Endereço dos alunos com matrícula inativa com parcelas pendentes*/
(8, 3, 'Ciclops', 'Rua Monóculos'),
(9, 2, 'Heholder', 'Avenida XZY');


INSERT INTO [Co_Signatario] ([nm], [cpf], [email], [dt_nasc]) VALUES 
('João Oliveira', '12345678901', 'joao.oliveira@email.com', '1990-01-01'),
('Maria Souza', '23456789012', 'maria.souza@email.com', '1989-02-02'),
('Carlos Costa', '34567890123', 'carlos.costa@email.com', '1988-03-03'),
('Ana Pereira', '45678901234', 'ana.pereira@email.com', '1987-04-04'),
('Paulo Lima', '56789012345', 'paulo.lima@email.com', '1986-05-05'),
('Fernanda Silva', '67890123456', 'fernanda.silva@email.com', '1985-06-06'),
('Ricardo Oliveira', '78901234567', 'ricardo.oliveira@email.com', '1984-07-07');


INSERT INTO [Conta_Bancaria] ([id_banco], [id_aluno], [agencia], [tp_conta], [num_conta]) VALUES 
(1, 1, '1234', 1, '12345678'),
(2, 2, '5678', 2, '23456789'),                                                                                         
(3, 3, '9101', 4, '34567890'),
(4, 4, '1121', 5, '45678901'),
(5, 5, '3141', 1, '56789012'),
(6, 6, '5161', 4, '67890123'),
(7, 7, '7181', 2, '78901234'),

/*1. Conta bancária dos alunos com matrícula inativa com parcelas pendentes*/
(3, 8, '1234', 1, '78579234'),
(6, 9, '8934', 1, '09356234');


INSERT INTO [Faculdade] ([nm], [cnpj], [email]) VALUES 
('Universidade Federal', '00000000000112', 'contato@uf.edu.br'),
('Faculdade de Engenharia', '00000000000223', 'engenharia@fe.edu.br'),
('Faculdade de Direito', '00000000000334', 'direito@fd.edu.br'),
('Universidade de São Paulo', '00000000000445', 'comunicacao@usp.edu.br'),
('Universidade de Minas Gerais', '00000000000556', 'adm@umg.edu.br'),
('Instituto Federal de Tecnologia', '00000000000667', 'info@ifet.edu.br'),
('Faculdade de Medicina', '00000000000778', 'medicina@fm.edu.br');


INSERT INTO [Curso] ([id_faculdade], [nm], [vl_mensal]) VALUES 
(1, 'Administração', 1200.50),
(6, 'Engenharia de Computação', 1500.75),
(7, 'Medicina', 5000.00),
(3, 'Direito', 1800.25),
(4, 'Psicologia', 1400.60),
(5, 'Educação Física', 1000.00),

/*5. Cursos da Faculdade de Engenharia*/
(2, 'Arquitetura', 1600.80), /*7*/
(2, 'Engenharia Elétrica', 1890.50); /*8*/


INSERT INTO [Matricula] ([id_aluno], [matricula], [id_curso], [ativo], [bolsa]) VALUES 
(2, '20240001', 1, 1, 50),
(1, '20240003', 3, DEFAULT, DEFAULT),
(6, '20240004', 4, 1, 20),
(4, '20240006', 6, DEFAULT, DEFAULT),

/*1. Matrícula dos alunos com matrícula inativa com parcelas pendentes*/
(8, '20240008', 6, DEFAULT, DEFAULT),
(9, '20240009', 4, DEFAULT, 50),

/*3. Matrículas com empréstimo que possuem tempo de carência*/
(7, '20240007', 7, 1, 30),
(3, '20240005', 5, 1, 40),

/*5. Matrículas ativas ou inativas da Faculdade de Engenharia onde o aluno já realizou um empréstimo*/
(5, '20220001', 7, DEFAULT, DEFAULT),
(6, '20220003', 8, DEFAULT, DEFAULT);

INSERT INTO [Emprestimo] ([id_cosig], [id_conta_bancaria], [vl_emprestimo], [dt_prazo], [dt_emprestimo], [parc], [juros], [dt_baixa]) VALUES 
(1, 1, 5000.00, '2025-12-01', DEFAULT, 12, 1.5, NULL),
(2, 2, 3000.00, '2025-12-01', DEFAULT,10, 3, NULL),

/*1. Empréstimo dos alunos com matrícula inativa com parcelas pendentes*/
(3, 8, 5000, '2025-07-25', '2024-07-15', 12, 1.5, NULL),
(5, 9, 10000, '2025-11-15', '2024-06-23', 7, 1.78, NULL),

/*3. Empréstimos com tempo de carência*/
(7, 7, 25830.00, '2026-06-03', '2019-06-01', 12, 2, NULL),
(3, 3, 12500.00, '2030-06-15', DEFAULT, 18, 2, NULL),

/*4. Enpréstimos ativos*/
(4, 4, 2000.00, '2024-03-20', '2023-09-20', 6, 4, '2024-02-23'),
(5, 5, 7000.00, '2025-09-18', '2023-09-01', 24, 3.5, '2024-06-02'),
(6, 6, 1500.00, '2022-03-30', '2021-07-01', 8, 5, '2022-03-17');


INSERT INTO [Parcela] ([id_emprestimo], [dt_prazo], [dt_baixa], [vl_parc]) VALUES 
(1, '2025-01-01', NULL, 491.67),
(2, '2025-02-01', NULL, 390.00),
(3, '2030-06-15', NULL, 944.45),
(4, '2023-11-09', '2023-10-09', 413.34),
(7, '2025-10-01', NULL, 2669.10),
(5, '2024-12-13', '2024-12-13', 361.67),

/*1. Parcelas dos alunos com matrícula inativa com parcelas pendentes*/
(8, '2025-02-20', NULL, 341,67),
(9, '2025-01-10', NULL, 1250.57),

/*2. Parcelas atrasadas*/
(4, '2024-02-18','2024-03-04', NULL, 413.34),
(5, '2024-04-01', '2024-06-02', NULL, 361.67),
(6, '2022-02-28', '2022-03-21', NULL, 262.50);
