CREATE TABLE [Banco] (
  [id] int IDENTITY(1, 1),
  [nm] varchar(60) NOT NULL,
  [cnpj] varchar(14) UNIQUE NOT NULL,
  CONSTRAINT pk_banco PRIMARY KEY (id)
)
GO

CREATE TABLE [Conta_Bancaria] (
  [id] int IDENTITY(1, 1),
  [id_banco] int NOT NULL,
  [id_aluno] int NOT NULL,
  [agencia] varchar(10) NOT NULL,
  [tp_conta] int NOT NULL,
  [num_conta] varchar(29) NOT NULL,
  CONSTRAINT pk_conta_bancaria PRIMARY KEY (id)
)
GO

CREATE TABLE [Matricula] (
  [id_aluno] int NOT NULL,
  [matricula] varchar(14) NOT NULL,
  [id_curso] int NOT NULL,
  [ativo]  bit NOT NULL,
  [bolsa] int NOT NULL,
  CONSTRAINT pk_matricula PRIMARY KEY (id_aluno, id_curso)
)
GO

CREATE TABLE [Curso] (
  [id] int IDENTITY(1, 1),
  [id_faculdade] int NOT NULL,
  [nm] varchar(50) NOT NULL,
  [vl_mensal] NUMERIC (14,2) NOT NULL,
  CONSTRAINT pk_curso PRIMARY KEY (id)
)
GO

CREATE TABLE [Faculdade] (
  [id] int IDENTITY(1, 1),
  [nm] varchar(60) NOT NULL,
  [cnpj] varchar(14) UNIQUE NOT NULL,
  [email] varchar(50) NOT NULL,
  CONSTRAINT pk_faculdade PRIMARY KEY (id)
)
GO

CREATE TABLE [Emprestimo] (
  [id] int IDENTITY(1, 1),
  [id_cosig] int NOT NULL,
  [id_conta_bancaria] int NOT NULL,
  [vl_emprestimo] NUMERIC(14, 2) NOT NULL,
  [dt_prazo] date NOT NULL,
  [dt_emprestimo] date NOT NULL,
  [parc] int NOT NULL,
  [juros] float NOT NULL,
  [dt_baixa] date,
  CONSTRAINT pk_emprestimo PRIMARY KEY (id)
)
GO

CREATE TABLE [Parcela] (
  [id] int IDENTITY(1, 1),
  [id_emprestimo] int NOT NULL,
  [dt_prazo] date NOT NULL,
  [dt_baixa] date,
  [vl_parc] numeric(14, 2) NOT NULL,
  CONSTRAINT pk_parcela PRIMARY KEY (id)
)
GO

CREATE TABLE [Estado] (
  [id] int IDENTITY(1, 1),
  [uf] char(2) UNIQUE NOT NULL,
  CONSTRAINT pk_estado PRIMARY KEY (id)
)
GO

CREATE TABLE [Cidade] (
  [id] int IDENTITY(1, 1),
  [nm] varchar(50) NOT NULL,
  [id_estado] int NOT NULL,
  CONSTRAINT pk_cidade PRIMARY KEY (id)
)
GO

CREATE TABLE [Endereco] (
  [id] int IDENTITY(1, 1),
  [id_aluno] int NOT NULL,
  [id_cidade] int NOT NULL,
  [bairro] varchar(50) NOT NULL,
  [logradouro] varchar(100) NOT NULL,
  CONSTRAINT pk_endereco PRIMARY KEY (id)
)
GO

CREATE TABLE [Aluno] (
  [id] int IDENTITY(1, 1),
  [nm] varchar(115) NOT NULL,
  [cpf] varchar(14) UNIQUE NOT NULL,
  [email] varchar(50) NOT NULL,
  [dt_nasc] date NOT NULL,
  CONSTRAINT pk_aluno PRIMARY KEY (id)
)
GO

CREATE TABLE [Co_Signatario] (
  [id] int IDENTITY(1, 1),
  [nm] varchar(115) NOT NULL,
  [cpf] varchar(14) UNIQUE NOT NULL,
  [email] varchar(50) NOT NULL,
  [dt_nasc] date NOT NULL,
  CONSTRAINT pk_co_signatario PRIMARY KEY (id)
)
GO

/*-----------------------------
    CONSTRAINTS
-----------------------------*/

/*-------- Chaves estrangeiras ---------*/
ALTER TABLE cidade
ADD CONSTRAINT fk_estado__cidade FOREIGN KEY (id_estado) REFERENCES estado(id)
GO

ALTER TABLE conta_bancaria
ADD CONSTRAINT fk_aluno__conta_bancaria FOREIGN KEY (id_aluno) REFERENCES aluno(id),
CONSTRAINT fk_banco__conta_bancaria FOREIGN KEY (id_banco) REFERENCES banco(id)
GO

ALTER TABLE curso
ADD CONSTRAINT fk_faculdade__curso FOREIGN KEY (id_faculdade) REFERENCES faculdade(id)
GO

ALTER TABLE emprestimo
ADD CONSTRAINT fk_conta_bancaria__emprestimo FOREIGN KEY (id_conta_bancaria) REFERENCES conta_bancaria(id),
CONSTRAINT fk_co_signatario__emprestimo FOREIGN KEY (id_cosig) REFERENCES co_signatario(id)
GO

ALTER TABLE endereco
ADD CONSTRAINT fk_cidade__endereco FOREIGN KEY (id_cidade) REFERENCES cidade(id)
GO

ALTER TABLE matricula
ADD CONSTRAINT fk_aluno__matricula FOREIGN KEY (id_aluno) REFERENCES aluno (id),
CONSTRAINT fk_curso__matricula FOREIGN KEY (id_curso) REFERENCES curso (id)
GO

ALTER TABLE parcela
ADD CONSTRAINT fk_emprestimo__parcela FOREIGN KEY (id_emprestimo) REFERENCES emprestimo (id)
GO

/*-------- Valores padrões ---------*/
ALTER TABLE conta_bancaria 
ADD CONSTRAINT chk_tp_conta CHECK (tp_conta BETWEEN 1 AND 5)
GO

ALTER TABLE emprestimo
ADD CONSTRAINT df_dt_emprestimo DEFAULT GETDATE() FOR dt_emprestimo
GO

ALTER TABLE matricula 
ADD CONSTRAINT df_ativo DEFAULT 0 FOR ativo
GO

ALTER TABLE matricula
ADD CONSTRAINT df_bolsa DEFAULT 0 FOR bolsa
GO
