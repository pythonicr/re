#' @title re_contains
#' @description Wraps the ``stringr::str_detect`` function.
#' @export
#' @inheritParams stringr::str_detect
#' @inheritDotParams re_compile
re_contains <- function(pattern, string, ...) {
  if (!is.regex(pattern)) {
    pattern <- re_compile(pattern, ...)
  }
  stringr::str_detect(string, pattern, negate = FALSE)
}
