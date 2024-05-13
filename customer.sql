WITH sa1_customer AS (
  SELECT
    A1_COD AS code,
    LEFT(GENERATE_UUID(), 8) AS name,
    SAFE.PARSE_DATE('%Y%m%d',  A1_XDATAIN) AS birthdate,
    'ERP' AS source,
    CAST(FLOOR(1000000*RAND()) AS INT64) AS cgc
, stg.mdmId as __mdmId, stg.mdmTenantId as __mdmTenantId, stg.mdmCounterForEntity as __mdmCounterForEntity, ARRAY[stg.mdmId] as __mdmStagingRecordIds, CASE WHEN stg.mdmEntityType is NULL THEN ARRAY[] ELSE ARRAY[SPLIT(stg.mdmEntityType, "#")[SAFE_OFFSET(0)]] END as __mdmSourceEntityNames, "84bc7902799e48bb9f0bd4082dd3db2d" as __mdmTaskId, "84bc7902799e48bb9f0bd4082dd3db2d" as __mdmSourceOperationTaskId
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

SELECT * , CASE WHEN RAND() >= 0.3 THEN TRUE ELSE FALSE END AS mdmDeleted FROM processedData

--internal--
