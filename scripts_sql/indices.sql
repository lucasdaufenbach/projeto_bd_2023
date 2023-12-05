--INDICES PARA AS CONSULTAS
CREATE INDEX idx_comanda_idcliente ON comanda(idcliente);

CREATE INDEX idx_pagamento_idcomanda ON pagamento(idcomanda);

CREATE INDEX idx_comanda_idfuncionario ON comanda(idfuncionario);

CREATE INDEX idx_pedidos_idcardapio ON pedidos(idcardapio);
CREATE INDEX idx_pedidos_idpedido_idcardapio ON pedidos(idpedido, idcardapio);
