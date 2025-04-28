-- Usuários
INSERT INTO Usuario (nome, email, senha, tipo) 
VALUES 
  ('João Cliente', 'joao@email.com', '123', 'cliente'),
  ('Maria Admin', 'maria@email.com', '456', 'admin'),
  ('Loja Tech', 'loja@email.com', '789', 'cliente');
 
-- Fornecedores
INSERT INTO Fornecedor (nome, cnpj, contato)
VALUES 
  ('Fornecedor Tech', '12.345.678/0001-99', 'contato@tech.com'),
  ('Livraria Cultura', '98.765.432/0001-11', 'vendas@cultura.com');
 
-- Categorias
INSERT INTO Categoria (nome, descricao)
VALUES 
  ('Eletrônicos', 'Dispositivos eletrônicos em geral'),
  ('Livros', 'Livros técnicos e literários');
 
-- Produtos
INSERT INTO Produto (nome, usuario_id, preco, quantidade_estoque, categoria_id, fornecedor_id)
VALUES 
  ('Notebook Dell i7', 3, 4500.00, 10, 1, 1),
  ('Livro: SQL para Iniciantes', 3, 89.90, 30, 2, 2),
  ('Smartphone Samsung S23', 3, 2999.90, 5, 1, 1);
 
-- Endereços
INSERT INTO Endereco (usuario_id, cep, logradouro, numero, bairro, cidade, estado)
VALUES 
  (1, '01234-567', 'Rua das Flores', '100', 'Centro', 'São Paulo', 'SP'),
  (3, '04567-890', 'Avenida Tech', '200', 'Industrial', 'Campinas', 'SP');
 
-- Pedidos
INSERT INTO Pedido (usuario_id, valor_total, status)
VALUES 
  (1, 4500.00, 'entregue'),
  (1, 3089.80, 'processando');
 
-- Itens do Pedido
INSERT INTO ItemPedido (pedido_id, produto_id, quantidade, preco_unitario)
VALUES 
  (1, 1, 1, 4500.00),
  (2, 2, 1, 89.90),
  (2, 3, 1, 2999.90);
 
-- Pagamentos
INSERT INTO Pagamento (pedido_id, metodo, valor, status)
VALUES 
  (1, 'cartao', 4500.00, 'aprovado'),
  (2, 'pix', 3089.80, 'pendente');
 
-- Entregas
INSERT INTO Entrega (pedido_id, endereco_entrega_id, transportadora, status)
VALUES 
  (1, 1, 'Correios', 'entregue'),
  (2, 1, 'Transportadora X', 'preparando');
 
-- Avaliações
INSERT INTO Avaliacao (produto_id, usuario_id, nota, comentario)
VALUES 
  (1, 1, 5, 'Notebook rápido e eficiente!'),
  (2, 1, 4, 'Livro muito útil para aprendizado.');
