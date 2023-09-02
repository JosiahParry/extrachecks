#' Run all Extra Checks
#' @inheritParams check_examples
#'
#' @details
#'
#' This is a bad path https://google.com/query
#'
#' @export
#' @examples
#' \dontrun{
#'   stop("dont run this code")
#' }
#'
#' httr::GET("google.com")
extrachecks <- function(path = ".") {
  ex <- check_examples(path)
  val <- check_return_values(path)
  dont <- check_dontrun(path)
  (urls <- urlchecker::url_check(path))
}

