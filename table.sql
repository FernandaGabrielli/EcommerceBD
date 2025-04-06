CREATE TABLE Usuario (
  usuario_id INT PRIMARY KEY IDENTITY(1, 1),
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  senha VARCHAR(255) NOT NULL,
  tipo VARCHAR(10) NOT NULL DEFAULT 'cliente',
  data_cadastro DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Fornecedor (
  fornecedor_id INT PRIMARY KEY IDENTITY(1, 1),
  nome VARCHAR(100) NOT NULL,
  cnpj VARCHAR(18) UNIQUE NOT NULL,
  contato VARCHAR(100) NOT NULL
);

CREATE TABLE Categoria (
  categoria_id INT PRIMARY KEY IDENTITY(1, 1),
  nome VARCHAR(50) NOT NULL,
  descricao TEXT
);

CREATE TABLE Produto (
  produto_id INT PRIMARY KEY IDENTITY(1, 1),
  nome VARCHAR(100) NOT NULL, -- NOVO CAMPO ADICIONADO
  usuario_id INT NOT NULL,
  data_pedido DATETIME NOT NULL DEFAULT GETDATE(),
  status VARCHAR(20) NOT NULL DEFAULT 'pendente',
  preco DECIMAL(10,2) NOT NULL,
  quantidade_estoque INT NOT NULL DEFAULT 0,
  categoria_id INT,
  fornecedor_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
  FOREIGN KEY (categoria_id) REFERENCES Categoria(categoria_id),
  FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
);

CREATE TABLE Endereco (
  endereco_id INT PRIMARY KEY IDENTITY(1, 1),
  usuario_id INT NOT NULL,
  cep VARCHAR(10) NOT NULL,
  logradouro VARCHAR(100) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  complemento VARCHAR(50),
  bairro VARCHAR(50) NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  estado CHAR(2) NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);

CREATE TABLE Pedido (
  pedido_id INT PRIMARY KEY IDENTITY(1, 1),
  usuario_id INT NOT NULL,
  data_pedido DATETIME NOT NULL DEFAULT GETDATE(),
  status VARCHAR(20) NOT NULL DEFAULT 'pendente',
  valor_total DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);

CREATE TABLE ItemPedido (
  item_id INT PRIMARY KEY IDENTITY(1, 1),
  pedido_id INT NOT NULL,
  produto_id INT NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
  FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

CREATE TABLE Pagamento (
  pagamento_id INT PRIMARY KEY IDENTITY(1, 1),
  pedido_id INT NOT NULL,
  metodo VARCHAR(10) NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'pendente',
  data_pagamento DATETIME,
  FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);

CREATE TABLE Entrega (
  entrega_id INT PRIMARY KEY IDENTITY(1, 1),
  pedido_id INT NOT NULL,
  endereco_entrega_id INT NOT NULL,
  transportadora VARCHAR(50) NOT NULL,
  codigo_rastreio VARCHAR(50),
  status VARCHAR(20) NOT NULL DEFAULT 'preparando',
  data_prevista DATE,
  data_entrega DATETIME,
  FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
  FOREIGN KEY (endereco_entrega_id) REFERENCES Endereco(endereco_id)
);

CREATE TABLE Avaliacao (
  avaliacao_id INT PRIMARY KEY IDENTITY(1, 1),
  produto_id INT NOT NULL,
  usuario_id INT NOT NULL,
  nota INT NOT NULL,
  comentario TEXT,
  data_avaliacao DATETIME NOT NULL DEFAULT GETDATE(),
  FOREIGN KEY (produto_id) REFERENCES Produto(produto_id),
  FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);
