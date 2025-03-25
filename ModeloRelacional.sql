CREATE TABLE [Usuario] (
  [usuario_id] int PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) NOT NULL,
  [email] varchar(100) UNIQUE NOT NULL,
  [senha] varchar(255) NOT NULL,
  [tipo] varchar(10) NOT NULL DEFAULT 'cliente',
  [data_cadatro] datetime NOT NULL DEFAULT (now())
)
GO

CREATE TABLE [Endereco] (
  [endereco_id] int PRIMARY KEY IDENTITY(1, 1),
  [usuario_id] int NOT NULL,
  [cep] varchar(10) NOT NULL,
  [logradouro] varchar(100) NOT NULL,
  [numero] varchar(10) NOT NULL,
  [complemento] varchar(50) NOT NULL,
  [bairro] varchar(50) NOT NULL,
  [cidade] varchar(50) NOT NULL,
  [estado] char(2) NOT NULL
)
GO

CREATE TABLE [Fornecedor] (
  [fornecedor_id] int PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) NOT NULL,
  [cnpj] varchar(18) UNIQUE NOT NULL,
  [contato] varchar(100) NOT NULL
)
GO

CREATE TABLE [Categoria] (
  [categoria_id] int PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(50) NOT NULL,
  [descricao] text
)
GO

CREATE TABLE [Produto] (
  [produto_id] int PRIMARY KEY IDENTITY(1, 1),
  [usuario_id] int NOT NULL,
  [data_pedido] datetime NOT NULL DEFAULT (now()),
  [status] varchar(20) NOT NULL DEFAULT (pendente),
  [preco] decimal(10,2) NOT NULL,
  [quantidade_estoque] int NOT NULL DEFAULT (0),
  [categoria_id] int,
  [fornecedor_id] int NOT NULL
)
GO

CREATE TABLE [Pedido] (
  [pedido_id] int PRIMARY KEY IDENTITY(1, 1),
  [usuario_id] int NOT NULL,
  [data_pedido] datetime NOT NULL DEFAULT (now()),
  [status] varchar(20) NOT NULL DEFAULT 'pendente',
  [valor_total] decimal(10,2) NOT NULL
)
GO

CREATE TABLE [ItemPedido] (
  [item_id] int PRIMARY KEY IDENTITY(1, 1),
  [pedido_id] int NOT NULL,
  [produto_id] int NOT NULL,
  [quantidade] int NOT NULL,
  [preco_unitario] decimal(10,2) NOT NULL
)
GO

CREATE TABLE [Pagamento] (
  [pagamento_id] int PRIMARY KEY IDENTITY(1, 1),
  [pedido_id] int NOT NULL,
  [metodo] varchar(10) NOT NULL,
  [valor] decimal(10,2) NOT NULL,
  [status] varchar(20) NOT NULL DEFAULT 'pendente',
  [data_pagamento] datetime
)
GO

CREATE TABLE [Entrega] (
  [entrega_id] int PRIMARY KEY IDENTITY(1, 1),
  [pedido_id] int NOT NULL,
  [endereco_entrega_id] int NOT NULL,
  [transportadora] varchar(50) NOT NULL,
  [codigo_rastreio] varchar(50),
  [status] varchar(20) NOT NULL DEFAULT 'preparando',
  [data_prevista] date,
  [data_entrega] datetime
)
GO

CREATE TABLE [Avaliacao] (
  [avaliacao_id] int PRIMARY KEY IDENTITY(1, 1),
  [produto_id] int NOT NULL,
  [usuario_id] int NOT NULL,
  [nota] int NOT NULL,
  [comentario] text,
  [data_avaliacao] datetime NOT NULL DEFAULT (now())
)
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'cliente|admin',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Usuario',
@level2type = N'Column', @level2name = 'tipo';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'pendente|processando|enviado|entregue|cancelado|devolução',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Produto',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'pendente|processando|enviado|entregue|cancelado',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Pedido',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'cartao|boleto|pix',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Pagamento',
@level2type = N'Column', @level2name = 'metodo';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'pendente|processando|aprovado|recusado|reembolsado',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Pagamento',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'preparando|enviado|transito|entregue',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Entrega',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '1-5',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Avaliacao',
@level2type = N'Column', @level2name = 'nota';
GO

ALTER TABLE [Endereco] ADD FOREIGN KEY ([usuario_id]) REFERENCES [Usuario] ([usuario_id])
GO

ALTER TABLE [Fornecedor] ADD FOREIGN KEY ([fornecedor_id]) REFERENCES [Produto] ([fornecedor_id])
GO

ALTER TABLE [Categoria] ADD FOREIGN KEY ([categoria_id]) REFERENCES [Produto] ([categoria_id])
GO

ALTER TABLE [Pedido] ADD FOREIGN KEY ([usuario_id]) REFERENCES [Usuario] ([usuario_id])
GO

ALTER TABLE [ItemPedido] ADD FOREIGN KEY ([pedido_id]) REFERENCES [Pedido] ([pedido_id])
GO

ALTER TABLE [ItemPedido] ADD FOREIGN KEY ([produto_id]) REFERENCES [Produto] ([produto_id])
GO

ALTER TABLE [Pagamento] ADD FOREIGN KEY ([pedido_id]) REFERENCES [Pedido] ([pedido_id])
GO

ALTER TABLE [Entrega] ADD FOREIGN KEY ([pedido_id]) REFERENCES [Pedido] ([pedido_id])
GO

ALTER TABLE [Entrega] ADD FOREIGN KEY ([endereco_entrega_id]) REFERENCES [Endereco] ([endereco_id])
GO

ALTER TABLE [Avaliacao] ADD FOREIGN KEY ([produto_id]) REFERENCES [Produto] ([produto_id])
GO

ALTER TABLE [Avaliacao] ADD FOREIGN KEY ([usuario_id]) REFERENCES [Usuario] ([usuario_id])
GO
