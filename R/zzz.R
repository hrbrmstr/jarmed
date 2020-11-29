.jarm <- NULL

.onLoad <- function(libname, pkgname) {
  path <- system.file("python", "jarm.py", package = "jarmed")
  .jarm <<- reticulate::py_run_file(path)
}