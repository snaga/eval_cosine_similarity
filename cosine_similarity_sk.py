#!/usr/bin/env python

import psycopg2
from sklearn.metrics.pairwise import cosine_similarity

conn = psycopg2.connect("dbname=test_cos_sim")
cur = conn.cursor()
q = """
SELECT
  a.id as "id1",
  a.vec as "vec1",
  b.id as "id2",
  b.vec as "vec2"
FROM
  data_vec a,
  data_vec b
WHERE
  a.id = 0
AND
  b.id <> 0
"""

cur.execute(q)
d = []
for r in cur.fetchall():
    d.append((r[2], cosine_similarity([r[1]], [r[3]])[0][0]))

print "sk_cli"
for r in sorted(d, key=lambda s: s[1], reverse=True)[:10]:
    print(r)

conn.close()
