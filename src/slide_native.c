/* Automatically generated. Do not edit by hand. */

#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>
#include <stdlib.h>

extern SEXP R_slide(SEXP argv_);

static const R_CallMethodDef CallEntries[] = {
  {"R_slide", (DL_FUNC) &R_slide, 1},
  {NULL, NULL, 0}
};

void R_init_cop(DllInfo *dll)
{
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
