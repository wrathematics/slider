# Copyright (C) 2017 by Drew Schmidt <wrathematics@gmail.com>
# 
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE

# Changes: 
#    * stop() calls replaced with comm.stop()
#    * add check.is.shaq()
#    * add check.is.matrix()
#    * add check.is.function()

is.badval <- function(x)
{
  is.na(x) || is.nan(x) || is.infinite(x)
}

is.inty <- function(x)
{
  abs(x - round(x)) < 1e-10
}

is.zero <- function(x)
{
  abs(x) < 1e-10
}

is.negative <- function(x)
{
  x < 0
}

is.annoying <- function(x)
{
  length(x) != 1 || is.badval(x)
}

is.string <- function(x)
{
  is.character(x) && !is.annoying(x)
}

is.flag <- function(x)
{
  is.logical(x) && !is.annoying(x)
}

is.posint <- function(x)
{
  is.numeric(x) && !is.annoying(x) && is.inty(x) && !is.negative(x) && !is.zero(x)
}



check.is.string <- function(x)
{
  if (!is.string(x))  
	{
    nm <- deparse(substitute(x))
    comm.stop(paste0("argument '", nm, "' must be a single string"), call.=FALSE)
  }
	
  invisible(TRUE)
}

check.is.string.or.null <- function(x)
{
  if (!is.null(x))
    check.is.string(x);
	
  invisible(TRUE)
}

check.is.int <- function(x)
{
  if (!is.numeric(x) || is.annoying(x) || !is.inty(x))  
  {
    nm <- deparse(substitute(x))
    comm.stop(paste0("argument '", nm, "' must be an integer"), call.=FALSE)
  }
  
  invisible(TRUE)
}

check.is.natnum <- function(x)
{
  if (!is.numeric(x) || is.annoying(x) || !is.inty(x) || is.negative(x))  
  {
    nm <- deparse(substitute(x))
    comm.stop(paste0("argument '", nm, "' must be a natural number (0 or positive integer)"), call.=FALSE)
  }
  
  invisible(TRUE)
}

check.is.posint <- function(x)
{
  if (!is.posint(x))
  {
    nm <- deparse(substitute(x))
    comm.stop(paste0("argument '", nm, "' must be a positive integer"), call.=FALSE)
  }
  
  invisible(TRUE)
}

check.is.flag <- function(x)
{
  if (!is.flag(x))
  {
    nm <- deparse(substitute(x))
    comm.stop(paste0("argument '", nm, "' must be TRUE or FALSE"), call.=FALSE)
  }
  
  invisible(TRUE)
}

check.is.shaq <- function(x)
{
  if (!is.shaq(x))
  {
    nm <- deparse(substitute(x))
    comm.stop(paste0("argument '", nm, "' must be a shaq"), call.=FALSE)
  }
  
  invisible(TRUE)
}

check.is.matrix <- function(x)
{
  if (!is.matrix(x))
  {
    nm <- deparse(substitute(x))
    comm.stop(paste0("argument '", nm, "' must be a matrix"), call.=FALSE)
  }
  
  invisible(TRUE)
}

check.is.function <- function(x)
{
  if (!is.function(x))  
	{
    nm <- deparse(substitute(x))
    comm.stop(paste0("argument '", nm, "' must be a function"), call.=FALSE)
  }
	
  invisible(TRUE)
}



check <- function(x)
{
  if (!isTRUE(x))
  {
    nm <- deparse(substitute(x))
    comm.stop(paste0("'", nm, "' is not TRUE"), call.=FALSE)
  }
  
  invisible(TRUE)
}
