#' Match a pattern against the entire string
#'
#' `re_fullmatch` checks whether each element of a character vector fully
#' matches a specified pattern (regular expression). If the provided pattern is
#' not already a compiled pattern object, it compiles it using `re_compile`. The
#' function ensures that the entire string matches the pattern from start to
#' end.
#'
#' @param pattern A regular expression pattern or a compiled pattern object.
#' @param string A character vector where each element is a string to be matched
#' against the pattern.
#' @param ... Additional arguments to be passed to `re_compile` if the pattern
#' needs to be compiled.
#' @return A list where each element is a character vector containing the full
#' match for the corresponding element of `string`, or `character(0)` if there
#' is no match.
#' #' @inheritDotParams re_compile
#' @examples
#' pattern <- re_compile("\\d{3}-\\d{2}-\\d{4}")
#' re_fullmatch(pattern, "123-45-6789") # Full match
#' re_fullmatch("123-45-6789", "123-45-6789 and more") # No full match
#' @seealso [Python re.fullmatch() documentation](https://docs.python.org/3/library/re.html#re.fullmatch)
#' @export
re_fullmatch <- function(pattern, string, ...) {
  if (!inherits(pattern, "Pattern")) {
    pattern <- re_compile(pattern, ...)
  }
  opts <- attr(pattern, "opts")
  if (!startsWith(pattern, "^")) {
    pattern <- paste0("^", pattern)
  }
  if (!endsWith(pattern, "$")) {
    pattern <- paste0(pattern, "$")
  }
  stringi::stri_extract_all_regex(string, pattern, opts_regex = opts)
}
