DROP FUNCTION IF EXISTS cosine_similarity(float8[], float8[]);

CREATE FUNCTION cosine_similarity (
    IN vec_a FLOAT8[],
    IN vec_b FLOAT8[],
    OUT dist FLOAT8)
AS '$libdir/cosine_similarity', 'cosine_similarity'
LANGUAGE C STRICT;
