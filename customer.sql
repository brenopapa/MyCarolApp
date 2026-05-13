DECLARE result STRING;
  SET result = 'done';

  MERGE ingestion_customer AS target
  USING (
      SELECT 'a8a201fd4d78325fdf9edcc91834963d' as mdmId, 0 as mdmCounterForEntity
      FROM ingestion_stg_agent_employee
      --timestamp-- WHERE mdmCounterForEntity__DATETIME__ > SAFE.DATETIME(TIMESTAMP_MICROS(SAFE_CAST({{start_from}} AS INT64)))
      LIMIT 1
  ) AS source
  ON target.mdmId = source.mdmId
  WHEN MATCHED THEN
      UPDATE SET target.mdmCounterForEntity = source.mdmCounterForEntity
  WHEN NOT MATCHED THEN
      INSERT (mdmId, mdmCounterForEntity)
      VALUES (source.mdmId, source.mdmCounterForEntity);

  SELECT result WHERE 1=2;
