#' @title re_split
#' @description Split ``string`` on ``pattern``. Split will occur ``n`` times.
#' @export
#' @inheritDotParams re_compile
#' @inheritParams stringr::str_split
re_split <- function(pattern, string, ..., n = Inf) {
  if (!is.regex(pattern)) {
    pattern <- re_compile(pattern, ...)
  }
  stringr::str_split(string, pattern, n = n, simplify = TRUE)
}
