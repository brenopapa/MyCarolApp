WITH sa1_customer AS (
  SELECT
    A1_COD AS code,
    LEFT(GENERATE_UUID(), 8) AS name,
    SAFE.PARSE_DATE('%Y%m%d',  A1_XDATAIN) AS birthdate,
    'ERP' AS source,
    CAST(FLOOR(1000000*RAND()) AS INT64) AS cgc
    --metadata--
  FROM (
    SELECT * EXCEPT(ranking)
    FROM (
      SELECT ROW_NUMBER() OVER (partition BY A1_COD ORDER BY mdmCounterForEntity DESC) ranking, *
      FROM stg_myconnector_sa1
      --timestamp-- WHERE mdmCounterForEntity__DATETIME__ > SAFE.DATETIME(TIMESTAMP_MICROS(SAFE_CAST({{start_from}} AS INT64)))
      --tenantIds-- and mdmTenantId IN {{tenantIds}}
    )
    WHERE ranking = 1
  ) AS stg
),
combinedSources AS (
  SELECT * FROM sa1_customer
),
processedData AS (
  SELECT *
  FROM combinedSources
  -- WHERE
  -- rejection rules
)

SELECT * except(mdmDeleted), CASE WHEN RAND() >= 0.3 THEN TRUE ELSE FALSE END AS mdmDeleted FROM processedData

--internal--