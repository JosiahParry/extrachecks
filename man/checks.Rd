% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checks.R, R/dontrun.R
\name{check_tag}
\alias{check_tag}
\alias{check_examples}
\alias{check_return_values}
\alias{check_license_year}
\alias{check_dontrun}
\title{Extra checks for an R package}
\usage{
check_tag(tag, path = ".")

check_examples(path = ".")

check_return_values(path = ".")

check_license_year(path = ".")

check_dontrun(path = ".")
}
\arguments{
\item{tag}{an Rd tag to check for example \verb{"\\\\value}}

\item{path}{default \code{"."}. The path to an R package.}
}
\description{
Extra checks for an R package

Common checks

Check for \verb{\dontrun} usage in examples
}
