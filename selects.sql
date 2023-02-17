-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

SELECT
    pedidos.id,
    pedidos.status,
    pedidos.cliente_id,
    produtos.id,
    produtos.nome,
    produtos.tipo,
    produtos.preco,
    produtos.pts_de_lealdade
FROM
    produtos_pedidos
    JOIN produtos ON produtos.id = produtos_pedidos.produto_id
    JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id;

-- 2)

SELECT
    pedidos.id
FROM
    produtos_pedidos
    JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
    JOIN produtos ON produtos.id = produtos_pedidos.produto_id
WHERE
    produtos.nome = 'Fritas';

-- 3)

SELECT
    clientes.nome AS gostam_de_fritas
FROM
    clientes
    JOIN pedidos ON clientes.id = pedidos.cliente_id
    JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
    JOIN produtos ON produtos.id = produtos_pedidos.produto_id
WHERE
    produtos.nome = 'Fritas';

-- 4)

SELECT
    SUM (produtos.preco) AS sum
FROM
    produtos_pedidos
    JOIN produtos ON produtos.id = produtos_pedidos.produto_id
    JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
    JOIN clientes ON clientes.id = cliente_id
WHERE
    clientes.nome = 'Laura';

-- 5)

SELECT
    produtos.nome,
    COUNT (produtos.id)
FROM
    produtos_pedidos
    JOIN produtos ON produtos.id = produtos_pedidos.produto_id
    JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
    JOIN clientes ON clientes.id = pedidos.id
GROUP BY
    produtos.nome
ORDER BY
    produtos.nome;