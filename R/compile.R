#' @title Create a Regular Expression Object with Specific Flags
#'
#' @description `re_compile` compiles a regular expression pattern with specified flags. This function allows setting
#' various flags akin to regex modifiers in other programming languages like Python. The flags control various aspects
#' of pattern matching. This function is really just a way to set flag arguments with a constant variable.
#'
#' @param pattern The regular expression pattern to be compiled.
#' @param IGNORECASE Flag to indicate case-insensitive matching.
#' @param I Abbreviation for IGNORECASE.
#' @param MULTILINE Flag to indicate multi-line matching, where `^` and `$` match the start and end of each line.
#' @param M Abbreviation for MULTILINE.
#' @param DOTALL Flag to indicate that `.` (dot) should match any character including newline.
#' @param S Abbreviation for DOTALL
#' @param VERBOSE Flag to allow a more verbose regex syntax, which can include comments and whitespace for readability.
#' @param X Abbreviation for VERBOSE
#' @param NOFLAG Flag to indicate that no flags should be set.
#' @return An object of class "Pattern" representing the compiled regular expression with the specified flags.
#' @examples
#' pattern <- re_compile("^abc", IGNORECASE)
#' pattern <- re_compile("end$", M = TRUE)
#' pattern <- re_compile("a.b", DOTALL = TRUE)
#' @seealso [Python re.compile() documentation](https://docs.python.org/3/library/re.html#re.compile)
#' @export
re_compile <- function(pattern,
                       IGNORECASE, I,
                       MULTILINE, M,
                       DOTALL, S,
                       VERBOSE, X,
                       NOFLAG) {
  opts <- if (!missing(NOFLAG)) {
    NULL
  } else {
    stringi::stri_opts_regex(
      case_insensitive = !missing(IGNORECASE) | !missing(I),
      comments = !missing(VERBOSE) | !missing(X),
      dotall = !missing(DOTALL) | !missing(S),
      multiline = !missing(MULTILINE) | !missing(M)
    )
  }
  structure(pattern,
    class = c("Pattern", class(pattern)),
    opts = opts
  )
}
