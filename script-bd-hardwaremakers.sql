CREATE TABLE pessoa(
  id_pessoa SERIAL PRIMARY KEY,
  nome varchar(255),
  cpf varchar(14)
);

SELECT*FROM pessoa;

INSERT INTO pessoa (nome, cpf) VALUES ('Allana Patrícia Lívia da Silva', '530.901.129-30');
INSERT INTO pessoa (nome, cpf) VALUES ('Francisca Amanda Carolina Almada', '391.331.205-60');
