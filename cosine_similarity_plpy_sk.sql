CREATE OR REPLACE FUNCTION cosine_similarity_sk(vec_a float8[], vec_b float8[])
  RETURNS float8
AS $$
    from sklearn.metrics.pairwise import cosine_similarity
    return cosine_similarity([vec_a], [vec_b])[0][0]
$$
LANGUAGE 'plpython2u';
