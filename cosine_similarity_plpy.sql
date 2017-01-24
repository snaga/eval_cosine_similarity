CREATE OR REPLACE FUNCTION cosine_similarity_plpy(vec_a float8[], vec_b float8[])
  RETURNS float8
AS $$
    from math import sqrt
    aa = 0
    bb = 0
    ab = 0
    for a,b in zip(vec_a, vec_b):
        aa += a * a
        bb += b * b
	ab += a * b
    return ab/(sqrt(aa)*sqrt(bb))
$$
LANGUAGE 'plpython2u';
