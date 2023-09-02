
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


#' Extra checks for an R package
#'
#' @param path default `"."`. The path to an R package.
#' @param tag an Rd tag to check for example `"\\value`
#' @rdname checks
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
#' @rdname checks
check_examples <- function(path = ".") {
  check_tag("\\examples", path)
}

#' @export
#' @rdname checks
check_return_values <- function(path = ".") {
  check_tag("\\value", path)
}


#' @export
#' @rdname checks
check_license_year <- function(path = ".") {
  license_path <- file.path(pkg_root(path), "LICENSE")
  if (file.exists(license_path)) {
    cli::cli_alert_info("No {.file LICENSE} file found")
    return(NA)
  }

  # parse license and identify line with year in it
  lic_lines <- readLines(license_path)
  year_index <- which(grepl("year", lic_lines, ignore.case = TRUE))

  if (length(year_index) == 0 || length(year_index) > 1) {
    cli::cli_alert_danger("Cannot determine license year")
    return(NA)
  }

  lic_year <- as.numeric(gsub("\\D", "", lic_lines[year_index]))

  cur_year <- as.numeric(format(Sys.Date(), "%Y"))

  lic_current <- identical(lic_year, cur_year)

  if (lic_current) {
    cli::cli_alert_success("{.file LICENSE} year is current")
  } else {
    cli::cli_alert_warning("{.file LICENSE} year is out of date: {lic_year}")
  }

  invisible(lic_current)

}
