#' Checks for the presence of a tag
#'
#' @rd an object of class `Rd` created with `tools::parse_Rd()`
#'
has_tag <- function(rd, tag) {
  any(vapply(rd, attr, character(1), "Rd_tag")  == tag)
}


#' Parses all Rd files
parse_all_rds <- function(path) {
  man_path <- file.path(path, "man")
  rd_paths <- list.files(man_path, full.names= TRUE, pattern = ".R")
  setNames(lapply(rd_paths, tools::parse_Rd), basename(tools::file_path_sans_ext(rd_paths)))
}

#' Get the root path of an R package
pkg_root <- function(path = ".") {
  rprojroot::find_root(rprojroot::is_r_package, path = path)
}


#' Check for the presence of an Rd tag
check_tag <- function(tag, path = ".") {
  root <- pkg_root(path)
  rds <- parse_all_rds(root)
  res <- vapply(rds, has_tag, logical(1), tag = tag)

  index <- which(!res)

  if (length(index) > 0) {
    cli::cli_alert_warning("\\{tag} missing from: {.fn {names(res)[index]}}")
  }

  res
}

#' Common checks
#' @export
check_examples <- function(path = ".") {
  check_tag("\\examples", path)
}

#' @export
check_return_values <- function(path = ".") {
  check_tag("\\value", path)
}


check_license_year <- function(path = ".") {

}
