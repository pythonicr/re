#' @title re_compile
#'
#' @description Roughly equivalent to python's re.compile. Though, it doesn't
#' provide the same performance benefits as python's re.compile.
#'
#' @param pattern string Regular expression pattern.
#' @param IGNORECASE boolean Whether or not to ignore case during matching.
#' @param I boolean Alternative to IGNORECASE.
#' @param MULTILINE boolean whether or not the matches should span over multiple
#' lines.
#' @param M boolean ALternative for MULTILINE.
#' @param DOTALL boolean Whether ``.`` should match line breaks.
#' @param S boolean Alternative for DOTALL.
#' @param VERBOSE boolean Whether pattern definitions span multiple lines.
#' @param X boolean Alternative for VERBOSE.
#' @param NOFLAG boolean If this flag is passed, all others are ignored.
#' @export
re_compile <- function(pattern,
                       IGNORECASE, I,
                       MULTILINE, M,
                       DOTALL, S,
                       VERBOSE, X,
                       NOFLAG,
                       ...) {
  if (!missing(NOFLAG)) {
    stringr::regex(pattern)
  } else {
    stringr::regex(
      pattern,
      ignore_case = !missing(IGNORECASE) | !missing(I),
      multiline = !missing(MULTILINE) | !missing(M),
      dotall = !missing(DOTALL) | !missing(S),
      comments = !missing(VERBOSE) | !missing(X),
      ...
    )
  }
}
