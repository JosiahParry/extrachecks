has_dontrun <- function(rd) {
  example_index <- which(vapply(rd, attr, character(1), "Rd_tag")  == "\\examples")
  if (length(example_index) == 0) {
    return(FALSE)
  } else {
    has_tag(rd[[example_index]], "\\dontrun")
  }
}

#' Check for `\dontrun` usage in examples
#'
#' @export
#' @rdname checks
check_dontrun <- function(path = ".") {
  root <- pkg_root(path)
  rds <- parse_all_rds(root)
  res <- vapply(rds, has_dontrun, logical(1))

  index <- which(res)

  if (length(index) > 0) {
    cli::cli_alert_warning("\\dontrun used in: {.fn {names(res)[index]}}")
  }

  res
}


