#' @title Match a pattern at the start of a string
#'
#' @description `re_match` checks whether each element of a character vector matches a specified pattern (regular
#' expression) at the start. If the provided pattern is not already a compiled pattern object, it compiles it using
#' `re_compile`. The function ensures that the matching occurs at the beginning of the string.
#'
#' @param pattern A regular expression pattern or a compiled pattern object.
#' @param string A character vector where each element is a string to be matched against the pattern at the beginning.
#' @param ... Additional arguments to be passed to `re_compile` if the pattern needs to be compiled.
#' @return A list where each element is a character vector containing the match found at the start of the corresponding
#' element of `string`, or `character(0)` if there is no match at the start.
#' @inheritDotParams re_compile
#' @examples
#' pattern <- re_compile("\\d{3}")
#' re_match(pattern, "123abc")
#' re_match("abc", "xyzabc")
#' @seealso
#' [Python re.match() equivalent functionality documentation](https://docs.python.org/3/library/re.html#re.match)
#' @export
re_match <- function(pattern, string, ...) {
  if (!inherits(pattern, "Pattern")) {
    pattern <- re_compile(pattern, ...)
  }
  opts <- attr(pattern, "opts")
  if (!startsWith(pattern, "^")) {
    pattern <- paste0("^", pattern)
  }
  stringi::stri_extract_all_regex(string, pattern, opts_regex = opts)
}
