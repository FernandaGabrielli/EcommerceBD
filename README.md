# Projeto de Banco de Dados para E-commerce

## **Objetivo**
O objetivo deste projeto é projetar e implementar um banco de dados relacional para um site de e-commerce, contemplando os principais requisitos de um sistema de comércio eletrônico e garantindo a normalização adequada. Além disso, o projeto inclui a criação de consultas SQL para demonstrar o funcionamento do banco de dados.

---

### **Contexto do Problema**
O grupo deverá projetar um banco de dados para um e-commerce genérico que permita a venda de produtos online, considerando as funcionalidades comuns de um sistema de comércio eletrônico.

### **Requisitos Funcionais do Banco de Dados**
O banco de dados deve contemplar as seguintes entidades e funcionalidades:

- **Usuários**: Cadastro de clientes e administradores com diferentes níveis de permissão.
- **Produtos**: Cada produto deve ter nome, descrição, categoria, preço, quantidade em estoque e fornecedor.
- **Pedidos**: Um usuário pode realizar pedidos com múltiplos itens.
- **Pagamentos**: Registro dos pagamentos efetuados (cartão, boleto, PIX, etc.).
- **Entrega**: Endereço de envio e status da entrega.
- **Avaliações**: Usuários podem avaliar produtos.

### **Regras de Normalização**
O banco de dados deve estar no mínimo na **3ª Forma Normal (3FN)** para evitar redundância e inconsistências.

### **Consultas SQL Obrigatórias**
Elaborar e testar consultas SQL para demonstrar a funcionalidade do sistema, incluindo:

1. Listar os produtos mais vendidos.
2. Listar os clientes que mais compraram no último mês.
3. Verificar o estoque baixo de produtos.
4. Consultar o faturamento por período.
5. Obter a média de avaliações de cada produto.

---

## **Modo de Entrega**

1. **Modelo Entidade-Relacionamento (MER)** e **Modelo Relacional**.
2. **Script SQL** para a criação do banco (tabelas, chaves primárias e estrangeiras).
3. **Scripts SQL** de inserção de dados simulados.
4. **Consultas SQL** exigidas e outras que julgarem relevantes.
5. **Relatório explicativo (PDF)** detalhando as decisões do projeto.
