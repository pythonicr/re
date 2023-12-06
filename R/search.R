#' Search for a pattern in a string
#'
#' `re_search` searches for occurrences of a specified pattern (regular
#' expression) within each element of a character vector. If the provided
#' pattern is not already a compiled pattern object, it compiles it using
#' `re_compile`.
#'
#' @param pattern A regular expression pattern or a compiled pattern object.
#' @param string A character vector where each element is a string in which to
#' search for the pattern.
#' @param ... Additional arguments to be passed to `re_compile` if the pattern
#' needs to be compiled.
#' @return A list where each element is a character vector containing all
#' matches found in the corresponding element of `string`. If no matches are
#' found, the element will be `character(0)`.
#' @inheritDotParams re_compile
#' @examples
#' pattern <- re_compile("\\d+")
#' re_search(pattern, "abc 123 xyz") # Finds "123"
#' re_search("\\bword\\b", "A sentence with the word.") # Finds "word"
#' @seealso [Python re.search() documentation](https://docs.python.org/3/library/re.html#re.search)
#' @export
re_search <- function(pattern, string, ...) {
  if (!inherits(pattern, "Pattern")) {
    pattern <- re_compile(pattern, ...)
  }
  stringi::stri_extract_all_regex(
    string,
    pattern,
    opts_regex = attr(pattern, "opts")
  )
}
