#include "postgres.h"

#include "utils/array.h"

#include <math.h>

PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(cosine_similarity);

Datum
cosine_similarity(PG_FUNCTION_ARGS)
{
  ArrayType  *vec_a = PG_GETARG_ARRAYTYPE_P(0);
  ArrayType  *vec_b = PG_GETARG_ARRAYTYPE_P(1);
  float8 ab = 0;
  float8 aa = 0;
  float8 bb = 0;
  int i;

  int len_a = (ARR_SIZE(vec_a) - ARR_DATA_OFFSET(vec_a)) / sizeof(float8);
  int len_b = (ARR_SIZE(vec_b) - ARR_DATA_OFFSET(vec_b)) / sizeof(float8);

  if (ARR_NDIM(vec_a) != ARR_NDIM(vec_b))
    elog(ERROR, "Dimention of both vectors must be the same.");
  if (len_a != len_b)
    elog(ERROR, "Length of both vectors must be the same.");

  float8 *a = (float8 *)ARR_DATA_PTR(vec_a);
  float8 *b = (float8 *)ARR_DATA_PTR(vec_b);

  for (i = 0; i < len_a; i++)
  {
    //    elog(INFO, "a=%f, b=%f", a[i], b[i]);
    aa += a[i] * a[i];
    bb += b[i] * b[i];
    ab += a[i] * b[i];
  }

  PG_RETURN_FLOAT8(ab/(sqrt(aa)*sqrt(bb)));
}
