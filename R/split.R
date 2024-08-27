#' @title Split a string by a regular expression pattern
#'
#' @description `re_split` splits each element of a character vector into substrings based on a specified pattern
#' (regular expression). If the provided pattern is not already a compiled pattern object, it compiles it using
#' `re_compile`. The function allows for controlling the maximum number of splits performed.
#'
#' @param pattern A regular expression pattern or a compiled pattern object.
#' @param string A character vector where each element is a string to be split.
#' @param maxsplit The maximum number of splits to perform on each string. If -1L (default), all possible splits are
#' performed.
#' @param ... Additional arguments to be passed to `re_compile` if the pattern needs to be compiled.
#' @return A list of character vectors, where each vector contains the substrings resulting from splitting the
#' corresponding element of `string`.
#' @inheritDotParams re_compile
#' @examples
#' pattern <- re_compile("\\s+")
#' re_split(pattern, "Split this string") # Splits on whitespace
#' re_split("\\W+", "Split,with!punctuation.morestuff", maxsplit = 2)
#' @seealso [Python re.split() documentation](https://docs.python.org/3/library/re.html#re.split)
#' @export
re_split <- function(pattern, string, ..., maxsplit = -1L) {
  maxsplit <- if (maxsplit < -1L) -1L else maxsplit
  maxsplit <- if (maxsplit > 0L) maxsplit + 1L else maxsplit
  if (!inherits(pattern, "Pattern")) {
    pattern <- re_compile(pattern, ...)
  }
  stringi::stri_split_regex(
    string,
    pattern,
    n = maxsplit,
    opts_regex = attr(pattern, "opts")
  )
}
