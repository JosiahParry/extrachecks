
<!-- README.md is generated from README.Rmd. Please edit that file -->

# extrachecks

<!-- badges: start -->
<!-- badges: end -->

The goal of extrachecks is to help you ensure that you pass common
manual checks that the CRAN team do that are not automated.

Inspired by
[DavisVaughan/extrachecks](https://github.com/DavisVaughan/extrachecks)
and my own frustration in publishing packages to CRAN.

## Installation

You can install the development version of extrachecks from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("JosiahParry/extrachecks")
```

## Example

Run the extra checks.

``` r
extrachecks::extrachecks()
#> ! \\examples missing from: `checks()`, `parse_all_rds()`, and `pkg_root()`
#> ! \\value missing from: `checks()`, `extrachecks()`, `parse_all_rds()`, and `pkg_root()`
#> ! \dontrun used in: `extrachecks()`
#> ✔ All URLs are correct!
```
