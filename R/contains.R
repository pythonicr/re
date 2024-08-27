#' @title Check if string contains a regular expression
#'
#' @description `re_contains` checks whether a specified pattern (regular expression) is found within each element of a
#' character vector. If the provided pattern is not already a compiled pattern object, it compiles it using
#' `re_compile`.
#'
#' @param pattern A regular expression pattern or a compiled pattern object.
#' @param string A character vector where each element is a string to be checked against the pattern.
#' @param ... Additional arguments to be passed to `re_compile`.
#' @return A logical vector of the same length as `string`, indicating whether each element contains a match for the
#' pattern.
#' @inheritDotParams re_compile
#' @examples
#' pattern <- re_compile("^abc", IGNORECASE)
#' re_contains(pattern, "Abcdef")
#' re_contains("xyz$", "hello world xyz")
#' @export
re_contains <- function(pattern, string, ...) {
  if (!inherits(pattern, "Pattern")) {
    pattern <- re_compile(pattern, ...)
  }
  stringi::stri_detect_regex(
    string,
    pattern,
    opts_regex = attr(pattern, "opts")
  )
}
