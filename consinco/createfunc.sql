CREATE OR REPLACE FUNCTION TESTEFUNC(mdmTenantId STRING, codColigada INT64, idPartida INT64)
RETURNS STRING
AS (
    TO_HEX(MD5(LOWER(CONCAT(
        mdmTenantId,
        'AccountingEntry{',
            '"CodigoColigada":"', codColigada, '",',
            '"IdentificacaoPartida":"', idPartida, '",',
            '"ERP":"RM",',
        '}'
    ))))
);

