#include <cstdlib>
#include <cstring>
#include <Rinternals.h>

#define CHARPT(x,i) ((char*)CHAR(STRING_ELT(x,i)))

extern int slide_main(int argc, char **argv);


static inline char *unliteral(const char *str)
{
  char *ret;
  ret = (char *) malloc(strlen(str) + 1);
  
  if (ret == NULL) 
    return NULL;
  
  strcpy(ret, str);
  return ret;
}

static inline int freestr(int argc, char **argv)
{
  int i;
  
  for (i=0; i<argc; i++)
    free(argv[i]);
  
  free(argv);
  
  return 0;
}



extern "C" SEXP R_slide(SEXP argv_)
{
  SEXP ret;
  int i;
  const int argc = LENGTH(argv_);
  
  char **argv = (char**) malloc(argc * sizeof(*argv));
  
  PROTECT(ret = allocVector(REALSXP, 1));
  
  for (i=0; i<argc; i++)
    argv[i] = unliteral(CHARPT(argv_, i));
  
  REAL(ret)[0] = slide_main(argc, argv);
  
  freestr(argc, argv);
  
  UNPROTECT(1);
  return ret;
}
