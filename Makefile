MODULE_big	= cosine_similarity
OBJS		= cosine_similarity.o

#EXTENSION = cosine_similarity
DATA = cosine_similarity.sql
PGFILEDESC = "cosine_similarity"

REGRESS = cosine_similarity

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/cosine_similarity
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
