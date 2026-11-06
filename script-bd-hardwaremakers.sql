CREATE TABLE pessoa(
  id_pessoa SERIAL PRIMARY KEY,
  nome varchar(255),
  cpf varchar(14)
);

SELECT * FROM pessoa;

INSERT INTO pessoa (nome, cpf) VALUES ('Allana Patrícia Lívia da Silva', '530.901.129-30');
INSERT INTO pessoa (nome, cpf) VALUES ('Francisca Amanda Carolina Almada', '391.331.205-60');

CREATE TABLE contas (
    id BIGSERIAL PRIMARY KEY,
    titular VARCHAR(100) NOT NULL,
    saldo NUMERIC(10, 2) NOT NULL,
    limite NUMERIC(10, 2) NOT NULL,
    pessoa_id INT,
    -- CORREÇÃO AQUI: Mudado de (id) para (id_pessoa)
    FOREIGN KEY (pessoa_id) REFERENCES pessoa(id_pessoa) 
);

CREATE TABLE receitas (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    conta_id BIGINT REFERENCES contas(id) ON DELETE CASCADE
);

CREATE TABLE despesas (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    paga BOOLEAN DEFAULT FALSE,
    conta_id BIGINT REFERENCES contas(id) ON DELETE SET NULL
);

CREATE TABLE metas (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    valor_alvo NUMERIC(10, 2) NOT NULL,
    valor_poupado NUMERIC(10, 2) DEFAULT 0.00
);

SELECT * FROM contas;

INSERT INTO contas (titular, saldo, limite, pessoa_id) 
VALUES ('Allana Patrícia Lívia da Silva', 530.00, 700.00, 1);
