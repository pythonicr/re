#' @noRd
#' @export
is.regex <- function(x) {
  inherits(x, "regex")
}
