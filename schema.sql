-- 1. Tabela de Contas
CREATE TABLE IF NOT EXISTS contas (
    id BIGSERIAL PRIMARY KEY,
    titular VARCHAR(100) NOT NULL,
    saldo NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
    limite NUMERIC(10, 2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Tabela de Receitas
CREATE TABLE IF NOT EXISTS receitas (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    conta_id BIGINT REFERENCES contas(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. Tabela de Despesas
CREATE TABLE IF NOT EXISTS despesas (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    paga BOOLEAN DEFAULT FALSE,
    conta_id BIGINT REFERENCES contas(id) ON DELETE SET NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. Tabela de Metas
CREATE TABLE IF NOT EXISTS metas (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    valor_alvo NUMERIC(10, 2) NOT NULL,
    valor_poupado NUMERIC(10, 2) DEFAULT 0.00,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

