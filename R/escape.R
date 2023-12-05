#' @title re_escape
#' @description Roughly equivalent to re.escape from python
#' @export
#' @inheritParams stringr::fixed
re_escape <- function(pattern) {
  stringi::stri_replace_all_regex(
    pattern,
    "([.^$\\\\|*+?{}\\[\\]()])",
    "\\\\\\1"
  )
}
