CREATE TABLE pessoa(
  id_pessoa SERIAL PRIMARY KEY,
  nome varchar(255),
  cpf varchar(14)
);

SELECT*FROM pessoa;

INSERT INTO pessoa (nome, cpf) VALUES ('Allana Patrícia Lívia da Silva', '530.901.129-30');
INSERT INTO pessoa (nome, cpf) VALUES ('Francisca Amanda Carolina Almada', '391.331.205-60');



CREATE TABLE IF NOT EXISTS contas (
    id BIGSERIAL PRIMARY KEY,
    titular VARCHAR(100) NOT NULL,
    saldo NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
    limite NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);


CREATE TABLE IF NOT EXISTS receitas (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    conta_id BIGINT REFERENCES contas(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
