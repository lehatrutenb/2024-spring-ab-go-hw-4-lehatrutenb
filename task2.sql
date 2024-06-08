CREATE TABLE payments (
    `id` String,
    `date` Date,
    `category` String,
    `purpose` String,
    `money` UInt32,
    `index` UInt32
)
ENGINE = ReplacingMergeTree(index)
ORDER BY concat(id, category, date);


CREATE MATERIALIZED VIEW IF NOT EXISTS payments_mv
TO payments
AS SELECT
    JSONExtractString(value,'id') AS id,
    toDate(JSONExtractString(value,'date')) AS date,
    JSONExtractString(value,'category') AS category,
    JSONExtractString(value,'purpose') AS purpose,
    JSONExtractString(value,'money') AS money,
    JSONExtractUInt(value,'index') AS index
FROM source
WHERE JSONExtractString(value,'type') == 'payment';