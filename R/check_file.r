check_file = function(file)
{
  if (!is.character(file) || length(file) != 1L || is.na(file))
    stop("'x' must be a single string")
  
  file = path.expand(file)
  if (!file.exists(file))
    stop("")
  
  normalizePath(path=file, winslash="/", mustWork=TRUE)
}
