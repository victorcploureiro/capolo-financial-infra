-- Criar Tabela de Contas
CREATE TABLE IF NOT EXISTS contas (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	tipo VARCHAR(50) NOT NULL,
	limite_credito NUMERIC(10, 2) DEFAULT 0.00,
	dia_fechamento INT,
	dia_vencimento INT,
	ativo BOOLEAN DEFAULT TRUE,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar Tabela de Categorias
CREATE TABLE IF NOT EXISTS categorias (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('DESPESA', 'RECEITA')),
	icone VARCHAR(50)
);

-- Criar Tabela de Compras Parceladas
CREATE TABLE IF NOT EXISTS compras_parceladas (
	id SERIAL PRIMARY KEY,
	conta_id INT REFERENCES contas(id) ON DELETE SET NULL,
	categoria_id INT REFERENCES categorias(id) ON DELETE SET NULL,
	descricao TEXT NOT NULL,
	valor_total NUMERIC(10, 2) NOT NULL,
	total_parcelas INT NOT NULL,
	valor_parcela NUMERIC(10, 2) NOT NULL,
	data_primeira_parcela DATE NOT NULL,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar Tabela Principal de Transações

CREATE TABLE IF NOT EXISTS transacoes (
	id SERIAL PRIMARY KEY,
	conta_id INT REFERENCES contas(id) ON DELETE SET NULL,
	categoria_id INT REFERENCES categorias(id) ON DELETE SET NULL,
	descricao TEXT NOT NULL,
	valor NUMERIC(10, 2) NOT NULL,
	tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('DESPESA', 'RECEITA', 'TRANSFERENCIA')),
	data_transacao DATE NOT NULL,
	status VARCHAR(20) DEFAULT 'CONCLUIDO',
	parcelado BOOLEAN DEFAULT FALSE,
	parcela_atual INT DEFAULT 1,
	total_parcelas INT DEFAULT 1,
	compra_parcelada_id INT REFERENCES compras_parceladas(id) ON DELETE CASCADE,
	comprovante_url TEXT,
	origem VARCHAR(50) DEFAULT 'MANUAL',
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categorias Iniciais Padrão
INSERT INTO categorias (nome, tipo) VALUES
('Alimentação / Mercado', 'DESPESA'),
('Restaurantes / Delivery', 'DESPESA'),
('Transporte / Combustível', 'DESPESA'),
('Moradia / Contas', 'DESPESA'),
('Saúde / Farmácia', 'DESPESA'),
('Lazer / Entretenimento', 'DESPESA'),
('Assinaturas / Serviços', 'DESPESA'),
('Compras Gerais', 'DESPESA'),
('Salário / Rendimento', 'RECEITA'),
('Investimentos / Rendimentos', 'RECEITA'),
('Outras Receitas', 'RECEITA');
