CREATE TABLE counters (
    id String,
    counter UInt32
)
ENGINE = SummingMergeTree()
ORDER BY id;

CREATE MATERIALIZED VIEW IF NOT EXISTS counters_mv
TO counters
AS SELECT
    JSONExtractString(value,'id') AS id,
    JSONExtractUInt(value,'value') AS counter
FROM source
WHERE JSONExtractString(value,'type') == 'counter';