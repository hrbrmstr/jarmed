#' Fingerprint a TLS server
#'
#' @param host host or IP to fingerprint
#' @param port port to connect on (defaults to `443L`)
#' @return `list` with class `jarm_result`
#' @export
#' @examples
#' jarm_fingerprint("rud.is")
jarm_fingerprint <- function(host, port = 443L) {

  host <- host[1]
  port <- as.integer(port[1])

  res <- .jarm$jarm_query(host, port)

  if (is.null(res$ip)) res$ip <- NA_character_

  class(res) <- c("jarm_result", "list")

  res

}

#' @keywords internal
#' @rdname jarm_fingerprint
#' @param x `jarm_result` object
#' @param ... unused
#' @return x (invisibly)
#' @export
print.jarm_result <- function(x, ...) {
  cat(
"  Host: ", x$host[1], "\n",
"  Port: ", x$port[1], "\n",
"    IP: ", x$ip[1], "\n",
"Result: ", x$result[1], "\n",
"  JARM: ", x$jarm[1], "\n", sep=""
  )
  invisible(x)
}


