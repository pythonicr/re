#' @title re_match
#' @description Matches ``pattern`` from the start of ``string``.
#' @export
#' @inheritDotParams re_compile
#' @inheritParams stringr::str_extract
re_match <- function(pattern, string, ...) {
  if (is.regex(pattern)) {
    pattern <- as.character(pattern)
  }
  if (!startsWith(pattern, "^")) {
    pattern <- paste0("^", pattern)
  }
  pattern <- re_compile(pattern, ...)
  return(stringr::str_extract(string, pattern))
}
