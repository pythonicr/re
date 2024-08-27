#' @title Substitute occurrences of a pattern in a string
#'
#' @description `re_sub` replaces all occurrences of a specified pattern (regular expression) in each element of a
#' character vector with a replacement string. If the provided pattern is not already a compiled pattern object, it
#' compiles it using `re_compile`.
#'
#' @param pattern A regular expression pattern or a compiled pattern object.
#' @param replacement The replacement string.
#' @param string A character vector where each element is a string in which the pattern will be replaced.
#' @param ... Additional arguments to be passed to `re_compile` if the pattern needs to be compiled.
#' @return A character vector of the same length as `string`, with all occurrences of the pattern replaced by
#' `replacement` in each element.
#' @inheritDotParams re_compile
#' @examples
#' pattern <- re_compile("\\d+")
#' re_sub(pattern, "number", "Replace 123 with text.") # Replaces "123" with "number"
#' re_sub("\\s+", "-", "Split and join") # Replaces spaces with hyphens
#' @seealso [Python re.sub() documentation](https://docs.python.org/3/library/re.html#re.sub)
#' @export
re_sub <- function(pattern, replacement, string, ...) {
  if (!inherits(pattern, "Pattern")) {
    pattern <- re_compile(pattern, ...)
  }
  stringi::stri_replace_all_regex(
    string,
    pattern,
    replacement,
    opts_regex = attr(pattern, "opts")
  )
}
