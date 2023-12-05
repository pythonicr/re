#' @title re_fullmatch
#' @description Matches ``pattern`` against the entire  ``string``.
#' @export
#' @inheritDotParams re_compile
#' @inheritParams stringr::str_extract
re_fullmatch <- function(pattern, string, ...) {
  if (is.regex(pattern)) {
    pattern <- as.character(pattern)
  }
  if (!startsWith(pattern, "^")) {
    pattern <- paste0("^", pattern)
  }
  if (!endsWith(pattern, "$")) {
    pattern <- paste0(pattern, "$")
  }
  pattern <- re_compile(pattern, ...)
  stringr::str_extract(string, pattern)
}
