CREATE TABLE Usuario (
  usuario_id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  senha VARCHAR(255) NOT NULL,
  tipo VARCHAR(10) NOT NULL DEFAULT 'cliente',
  data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
 
CREATE TABLE Fornecedor (
  fornecedor_id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome VARCHAR(100) NOT NULL,
  cnpj VARCHAR(18) NOT NULL UNIQUE,
  contato VARCHAR(100) NOT NULL
);
 
CREATE TABLE Categoria (
  categoria_id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome VARCHAR(50) NOT NULL,
  descricao TEXT
);
 
CREATE TABLE Produto (
  produto_id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome VARCHAR(100) NOT NULL,
  usuario_id INTEGER NOT NULL,
  data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(20) NOT NULL DEFAULT 'pendente',
  preco DECIMAL(10,2) NOT NULL,
  quantidade_estoque INTEGER NOT NULL DEFAULT 0,
  categoria_id INTEGER,
  fornecedor_id INTEGER NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
  FOREIGN KEY (categoria_id) REFERENCES Categoria(categoria_id),
  FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
);
 
CREATE TABLE Endereco (
  endereco_id INTEGER PRIMARY KEY AUTOINCREMENT,
  usuario_id INTEGER NOT NULL,
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
  pedido_id INTEGER PRIMARY KEY AUTOINCREMENT,
  usuario_id INTEGER NOT NULL,
  data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(20) NOT NULL DEFAULT 'pendente',
  valor_total DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);
 
CREATE TABLE ItemPedido (
  item_id INTEGER PRIMARY KEY AUTOINCREMENT,
  pedido_id INTEGER NOT NULL,
  produto_id INTEGER NOT NULL,
  quantidade INTEGER NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
  FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);
 
CREATE TABLE Pagamento (
  pagamento_id INTEGER PRIMARY KEY AUTOINCREMENT,
  pedido_id INTEGER NOT NULL,
  metodo VARCHAR(10) NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'pendente',
  data_pagamento TIMESTAMP,
  FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);
 
CREATE TABLE Entrega (
  entrega_id INTEGER PRIMARY KEY AUTOINCREMENT,
  pedido_id INTEGER NOT NULL,
  endereco_entrega_id INTEGER NOT NULL,
  transportadora VARCHAR(50) NOT NULL,
  codigo_rastreio VARCHAR(50),
  status VARCHAR(20) NOT NULL DEFAULT 'preparando',
  data_prevista DATE,
  data_entrega TIMESTAMP,
  FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
  FOREIGN KEY (endereco_entrega_id) REFERENCES Endereco(endereco_id)
);
 
CREATE TABLE Avaliacao (
  avaliacao_id INTEGER PRIMARY KEY AUTOINCREMENT,
  produto_id INTEGER NOT NULL,
  usuario_id INTEGER NOT NULL,
  nota INTEGER NOT NULL,
  comentario TEXT,
  data_avaliacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (produto_id) REFERENCES Produto(produto_id),
  FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);
