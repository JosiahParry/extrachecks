# extrachecks

extracheck <- function(path = ".") {
  ex <- check_examples(path)
  val <- check_return_values(path)
  dont <- check_dontrun(path)
  urls <- urlchecker::url_check(path)
}
