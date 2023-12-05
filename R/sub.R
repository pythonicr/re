#' @title re_sub
#' @description Replace all occurrences of ``pattern`` in ``string`` with
#' ``replacement``.
#' @export
#' @inheritDotParams re_compile
#' @inheritParams stringr::str_replace_all
re_sub <- function(pattern, replacement, string, ...) {
  if (!is.regex(pattern)) {
    pattern <- re_compile(pattern, ...)
  }
  stringr::str_replace_all(string, pattern, replacement)
}
