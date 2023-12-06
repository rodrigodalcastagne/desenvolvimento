CREATE TABLE  clientes (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE  profissionais (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE  servicos (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE  agendamentos (
    id INT NOT NULL PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    id_profissional INT NOT NULL,
    id_servico INT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY(id_profissional) REFERENCES profissionais(id),
    FOREIGN KEY(id_servico) REFERENCES servicos(id),
    FOREIGN KEY(id_cliente) REFERENCES clientes(id)
);
-- CREATE
INSERT INTO clientes (id, nome, email, telefone, endereco) VALUES (1, 'Nome do Cliente', 'email@exemplo.com', '123456789', 'Endereço do Cliente');
INSERT INTO profissionais (id, nome) VALUES (1, 'Nome do Profissional');
INSERT INTO servicos (id, nome) VALUES (1, 'Nome do Serviço');
INSERT INTO agendamentos (id, data, hora, id_profissional, id_servico, id_cliente) VALUES (1, '2023-12-06', '13:57:06', 1, 1, 1);

-- READ
SELECT * FROM clientes;
SELECT * FROM profissionais;
SELECT * FROM servicos;
SELECT * FROM agendamentos;

-- UPDATE
UPDATE clientes SET nome = 'Novo Nome do Cliente' WHERE id = 1;
UPDATE profissionais SET nome = 'Novo Nome do Profissional' WHERE id = 1;
UPDATE servicos SET nome = 'Novo Nome do Serviço' WHERE id = 1;
UPDATE agendamentos SET data = '2023-12-07' WHERE id = 1;

-- Função para inserir um novo cliente
CREATE OR REPLACE FUNCTION create_cliente(p_nome VARCHAR, p_email VARCHAR, p_telefone VARCHAR, p_endereco VARCHAR)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO clientes (nome, email, telefone, endereco) VALUES (p_nome, p_email, p_telefone, p_endereco);
END;
$$
LANGUAGE plpgsql;

-- Função para obter um cliente
CREATE OR REPLACE FUNCTION read_cliente(p_id INT)
RETURNS TABLE(id INT, nome VARCHAR, email VARCHAR, telefone VARCHAR, endereco VARCHAR) AS
$$
BEGIN
    RETURN QUERY SELECT * FROM clientes WHERE id = p_id;
END;
$$
LANGUAGE plpgsql;

-- Função para atualizar um cliente
CREATE OR REPLACE FUNCTION update_cliente(p_id INT, p_nome VARCHAR, p_email VARCHAR, p_telefone VARCHAR, p_endereco VARCHAR)
RETURNS VOID AS
$$
BEGIN
    UPDATE clientes SET nome = p_nome, email = p_email, telefone = p_telefone, endereco = p_endereco WHERE id = p_id;
END;
$$
LANGUAGE plpgsql;

-- Função para deletar um cliente
CREATE OR REPLACE FUNCTION delete_cliente(p_id INT)
RETURNS VOID AS
$$
BEGIN
    DELETE FROM agendamentos WHERE id_cliente = p_id;
    DELETE FROM clientes WHERE id = p_id;
END;
$$
LANGUAGE plpgsql;



