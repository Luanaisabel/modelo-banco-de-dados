CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);