#' @title re_search
#' @description Matches the first ``pattern`` in ``string``.
#' @export
#' @inheritDotParams re_compile
#' @inheritParams stringr::str_extract
re_search <- function(pattern, string, ...) {
  if (!is.regex(pattern)) {
    pattern <- re_compile(pattern, ...)
  }
  stringr::str_extract(string, pattern)
}
