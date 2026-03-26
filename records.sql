SELECT 'a8a201fd4d78325fdf9edcc91834963d' as __mdmId, 0 as __mdmCounterForEntity
FROM ingestion_stg_agent_employee
--timestamp-- WHERE mdmCounterForEntity__DATETIME__ > SAFE.DATETIME(TIMESTAMP_MICROS(SAFE_CAST({{start_from}} AS INT64)))
LIMIT 1
