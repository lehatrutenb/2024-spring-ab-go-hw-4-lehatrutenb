INSERT INTO source
SELECT
    jsonMergePatch(value, toJSONString(map('money', 50000, 'index', JSONExtractUInt(value, 'index') + 1))) as value
FROM source
WHERE and(JSONExtractString(value,'type') == 'payment', JSONExtractString(value,'id') == 'recipe1', 
          JSONExtractString(value,'id') == 'recipe1', toDayOfMonth(toDate(JSONExtractString(value,'date'))) == 1);