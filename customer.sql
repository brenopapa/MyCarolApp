MERGE ingestion_customer AS target
  USING (
      SELECT 'a8a201fd4d78325fdf9edcc91834963d' as __mdmId, 0 as __mdmCounterForEntity
      FROM ingestion_stg_agent_employee
      --timestamp-- WHERE mdmCounterForEntity__DATETIME__ > SAFE.DATETIME(TIMESTAMP_MICROS(SAFE_CAST({{start_from}} AS INT64)))
      LIMIT 1
  ) AS source
  ON target.__mdmId = source.__mdmId
  WHEN MATCHED THEN
      UPDATE SET
          target.__mdmCounterForEntity = source.__mdmCounterForEntity
  WHEN NOT MATCHED THEN
      INSERT (__mdmId, __mdmCounterForEntity)
      VALUES (source.__mdmId, source.__mdmCounterForEntity)
