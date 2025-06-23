-- CRIAÇÃO DAS TABELAS
CREATE TABLE Produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco NUMERIC(10,2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_produto INT NOT NULL REFERENCES Produtos(id_produto),
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL
);

-- INSERÇÃO DE DADOS
INSERT INTO Produtos (nome, preco, estoque) VALUES
('Livro A', 39.90, 10),
('Livro B', 24.50, 5),
('Livro C', 59.90, 2);

INSERT INTO Pedidos (id_produto, quantidade, data_pedido) VALUES
(1, 2, '2025-06-20'),
(2, 1, '2025-06-21'),
(3, 1, '2025-06-22');

-- ATUALIZAÇÃO DE DADOS
UPDATE Produtos
SET estoque = estoque - 1
WHERE id_produto = 1;

-- REMOÇÃO DE UM PEDIDO
DELETE FROM Pedidos
WHERE id_pedido = 2;

-- CONSULTA SIMPLES: Listar todos os produtos
SELECT * FROM Produtos;

-- CONSULTA COM JOIN: Ver pedidos com nomes dos produtos
SELECT p.nome, ped.quantidade, ped.data_pedido
FROM Pedidos ped
JOIN Produtos p ON ped.id_produto = p.id_produto;

-- CONSULTA COM CONDIÇÃO: Produtos com estoque baixo
SELECT nome, estoque
FROM Produtos
WHERE estoque < 5;
