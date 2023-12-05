CREATE FUNCTION fn_CalcularTotalPedido
(
    @idcomanda INT
)
RETURNS NUMERIC
AS
BEGIN
    DECLARE @total NUMERIC;

    SELECT @total = SUM(c.valor * p.qtde)
    FROM pedidos p
    INNER JOIN cardapio c ON p.idcardapio = c.idcardapio
    WHERE p.idcomanda = @idcomanda;

    RETURN ISNULL(@total, 0);
END;
