-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO
    clientes (nome, lealdade)
VALUES
    ('Georgia', 0);

-- 2)

INSERT INTO
    pedidos (status, cliente_id)
VALUES
    ('Recebido', 6);

-- 3)

INSERT INTO
    produtos_pedidos (pedido_id, produto_id)
VALUES
    (6, 1),
    (6, 2),
    (6, 6),
    (6, 8),
    (6, 8);

-- Leitura

-- 1)

SELECT
    clientes.id,
    clientes.nome,
    clientes.lealdade,
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
    JOIN pedidos ON pedidos.id = produtos_pedidos.pedido_id
    JOIN clientes ON clientes.id = cliente_id
    
    WHERE clientes.nome = 'Georgia';

-- Atualização

-- 1)

UPDATE
    clientes
SET
    lealdade = (
        SELECT
        SUM(pts_de_lealdade)
        FROM
        clientes c
        JOIN pedidos pe ON c.id = pe.cliente_id
        JOIN produtos_pedidos pr_pe ON pe.id = pr_pe.pedido_id
        JOIN produtos pr ON pr.id = pr_pe.produto_id
        WHERE
        c.nome = 'Georgia'
    )
WHERE
    nome = 'Georgia';

-- Deleção

-- 1)

DELETE FROM
    clientes
WHERE
    nome = 'Marcelo';