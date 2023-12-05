CREATE PROCEDURE sp_AtualizarStatusMesa
    @idmesa INT,
    @novoStatus CHAR(1)
AS
BEGIN
    UPDATE mesa
    SET status = @novoStatus
    WHERE idmesa = @idmesa;
END;

