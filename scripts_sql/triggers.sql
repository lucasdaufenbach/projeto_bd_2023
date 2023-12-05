CREATE TRIGGER trg_AuditoriaCliente
ON cliente
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF OBJECT_ID('tempdb..#ClienteAudit') IS NOT NULL
        DROP TABLE #ClienteAudit;

    CREATE TABLE #ClienteAudit (
        Operacao    VARCHAR(10),
        idcliente   INT,
        nm_cliente  VARCHAR(50),
        telefone    CHAR(11),
        cpf         CHAR(11),
        DataAlteracao DATETIME DEFAULT GETDATE()
    );

    DECLARE @Operacao VARCHAR(10);
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
        IF EXISTS(SELECT * FROM deleted)
            SET @Operacao = 'UPDATE';
        ELSE
            SET @Operacao = 'INSERT';

        INSERT INTO #ClienteAudit (Operacao, idcliente, nm_cliente, telefone, cpf)
        SELECT @Operacao, idcliente, nm_cliente, telefone, cpf FROM inserted;
    END
    ELSE IF EXISTS(SELECT * FROM deleted)
    BEGIN
        SET @Operacao = 'DELETE';
        INSERT INTO #ClienteAudit (Operacao, idcliente, nm_cliente, telefone, cpf)
        SELECT @Operacao, idcliente, nm_cliente, telefone, cpf FROM deleted;
    END;
    -- Aqui você pode realizar operações com a tabela de auditoria se desejar
END;
