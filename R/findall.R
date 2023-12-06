#' Extract all occurrences of a pattern in a string
#'
#' `re_findall` extracts all occurrences of a specified pattern (regular
#' expression) from each element of a character vector. If the provided pattern
#' is not already a compiled pattern object, it compiles it using `re_compile`.
#'
#' @param pattern A regular expression pattern or a compiled pattern object.
#' @param string A character vector where each element is a string from which to
#' extract matches of the pattern.
#' @param ... Additional arguments to be passed to `re_compile` if the pattern
#' needs to be compiled.
#' @return A list of character vectors, where each vector contains all the
#' matches found in the corresponding element of `string`.
#' @inheritDotParams re_compile
#' @examples
#' pattern <- re_compile("\\b\\w+\\b")
#' re_findall(pattern, "This is a test.") # Extracts all words
#' re_findall("\\d+", "123 abc 456")
#' @seealso [Python re.findall() documentation](https://docs.python.org/3/library/re.html#re.findall)
#' @export
re_findall <- function(pattern, string, ...) {
  if (!inherits(pattern, "Pattern")) {
    pattern <- re_compile(pattern, ...)
  }
  stringi::stri_extract_all_regex(
    string,
    pattern,
    opts_regex = attr(pattern, "opts")
  )
}
