-- 1. Produtos mais vendidos (por quantidade)
SELECT p.nome, SUM(ip.quantidade) AS total_vendido
FROM ItemPedido ip
JOIN Produto p ON ip.produto_id = p.produto_id
GROUP BY p.nome
ORDER BY total_vendido DESC;
 
-- 2. Clientes que mais compraram (último mês)
SELECT u.nome, SUM(p.valor_total) AS total_gasto
FROM Pedido p
JOIN Usuario u ON p.usuario_id = u.usuario_id
WHERE p.data_pedido >= DATE('now', '-1 month')
GROUP BY u.nome
ORDER BY total_gasto DESC;
 
-- 3. Produtos com estoque baixo (< 5 unidades)
SELECT nome, quantidade_estoque
FROM Produto
WHERE quantidade_estoque < 5;
 
-- 4. Faturamento por mês (últimos 3 meses)
SELECT 
  STRFTIME('%Y-%m', data_pedido) AS mes,
  SUM(valor_total) AS faturamento
FROM Pedido
WHERE data_pedido >= DATE('now', '-3 months')
GROUP BY STRFTIME('%Y-%m', data_pedido)
ORDER BY mes;
 
-- 5. Média de avaliações por produto
SELECT p.nome, AVG(a.nota) AS media_avaliacoes
FROM Produto p
LEFT JOIN Avaliacao a ON p.produto_id = a.produto_id
GROUP BY p.nome;
