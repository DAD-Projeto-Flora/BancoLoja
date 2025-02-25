CREATE TABLE Cliente
(
    ID INT PRIMARY KEY,
    nome VARCHAR(30),
    sobrenome VARCHAR(60),
    endereco VARCHAR(200),
    sexo VARCHAR(9),
    nome_usuario VARCHAR(50),
    foto_perfil VARCHAR(500)
);

CREATE TABLE Pedido
(
    ID INT PRIMARY KEY,
    ID_produto INT,
    ID_cliente INT,
    data_pedido DATE,
    qnt_produto INT,
    forma_pgto VARCHAR(50),
    data_pgto DATE,
    preco_total NUMERIC(10,2),
    idCliente INT,
    idProduto INT
);

CREATE TABLE Produto
(
    nome VARCHAR(50),
    preco_unid NUMERIC(10,2),
    ID INT PRIMARY KEY,
    ID_categoria INT,
    qnt_estoque INT
);

CREATE TABLE Categoria
(
    ID INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE Cartao
(
    numero VARCHAR(16) PRIMARY KEY,
    ID_cliente INT,
    CVV VARCHAR(3),
    validade DATE,
    nome_cartao VARCHAR(50)
);

CREATE TABLE Telefone
(
    numero INT,
    ID INT PRIMARY KEY,
    ID_cliente INT
);

ALTER TABLE Pedido ADD FOREIGN KEY(ID_cliente) REFERENCES Cliente (ID);
ALTER TABLE Pedido ADD FOREIGN KEY(ID_produto) REFERENCES Produto (ID);
ALTER TABLE Produto ADD FOREIGN KEY(ID_categoria) REFERENCES Categoria (ID);
ALTER TABLE Cartao ADD FOREIGN KEY(ID_cliente) REFERENCES Cliente (ID);
ALTER TABLE Telefone ADD FOREIGN KEY(ID_cliente) REFERENCES Cliente (ID);
