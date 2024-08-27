#' @title Escape special characters
#'
#' @description `re_escape` escapes all special characters in a string. This function is useful when you want to treat a
#' string literally in a regular expression context, escaping characters that would otherwise be interpreted as special
#' regex operators.
#'
#' @param pattern A character vector where each element is a string in which special regex characters are to be escaped.
#' @return A character vector of the same length as `pattern`.
#' @examples
#' re_escape("a[bc].*d?")
#' re_escape(".^$|*+?{}[]()")
#' @seealso [Python re.escape() documentation](https://docs.python.org/3/library/re.html#re.escape)
#' @export
re_escape <- function(pattern) {
  stringi::stri_replace_all_regex(
    pattern,
    "([.^$\\\\|*+?{}\\[\\]()])",
    "\\\\$1"
  )
}
