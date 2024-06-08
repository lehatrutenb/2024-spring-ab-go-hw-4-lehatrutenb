CREATE TABLE payments_for_parents (
    `id` String,
    `date` Date,
    `category` String,
    `purpose` String,
    `money` UInt32,
    `index` UInt32
)
ENGINE = ReplacingMergeTree(index)
ORDER BY concat(id, category, date);


CREATE MATERIALIZED VIEW IF NOT EXISTS payments_for_parents_mv
TO payments_for_parents
AS SELECT
    id AS id,
    date AS date,
    category AS category,
    purpose AS purpose,
    money AS money,
    index AS index
FROM payments
WHERE (category != 'gaming') AND (category != 'useless');