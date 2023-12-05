#' @title re_findall
#' @description Matches all occurrences of ``pattern`` in ``string``.
#' @export
#' @inheritDotParams re_compile
#' @inheritParams stringr::str_extract_all
re_findall <- function(pattern, string, ...) {
  if (!is.regex(pattern)) {
    pattern <- re_compile(pattern, ...)
  }
  stringr::str_extract_all(string, pattern, simplify = TRUE)
}
