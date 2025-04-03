CREATE TABLE cliente
(
    id SERIAL PRIMARY KEY,
    nome_completo VARCHAR(90),
    email VARCHAR(50) UNIQUE,
    nome_usuario VARCHAR(50) UNIQUE,
    foto_perfil VARCHAR(500),
    senha VARCHAR(30),
    telefone VARCHAR(11)

);

CREATE TABLE pedido
(
    id SERIAL PRIMARY KEY,
    id_produto INT,
    id_cliente INT,
    data_pedido DATE,
    qnt_produto INT,
    forma_pgto VARCHAR(50),
    data_pgto DATE,
    preco_total NUMERIC(10,2),
    idCliente INT,
    idProduto INT
);

CREATE TABLE produto
(
    nome VARCHAR(50),
    preco_unid NUMERIC(10,2),
    id SERIAL PRIMARY KEY,
    id_categoria INT,
    qnt_estoque INT,
    nota_avaliacao NUMERIC(1,2) CHECK nota_avaliacao BETWEEN 1 AND 5
    url_imagem VARCHAR(1024)
);

CREATE TABLE categoria
(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE cartao
(
    numero VARCHAR(16) PRIMARY KEY,
    id_cliente INT,
    CVV VARCHAR(3),
    validade DATE,
    nome_cartao VARCHAR(50),
    apelido_cartao VARCHAR(40)
);

CREATE TABLE endereco
(
    id SERIAL PRIMARY KEY,
    id_cliente INT,
    cep VARCHAR(9),
    numero INT,
    logradouro VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    ponto_referencia VARCHAR(30)
);

CREATE TABLE admin
(
    id SERIAL PRIMARY KEY,
    nome VARCHAR UNIQUE,
    email VARCHAR(50) UNIQUE,
    senha VARCHAR(50)
);

ALTER TABLE pedido ADD FOREIGN KEY(id_cliente) REFERENCES cliente (id);
ALTER TABLE pedido ADD FOREIGN KEY(id_produto) REFERENCES produto (id);
ALTER TABLE produto ADD FOREIGN KEY(id_categoria) REFERENCES categoria (id);
ALTER TABLE cartao ADD FOREIGN KEY(id_cliente) REFERENCES cliente (id);
ALTER TABLE endereco ADD FOREIGN KEY(id_cliente) REFERENCES cliente (id);


