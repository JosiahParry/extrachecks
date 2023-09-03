
<!-- README.md is generated from README.Rmd. Please edit that file -->

# extrachecks

<!-- badges: start -->
<!-- badges: end -->

The goal of extrachecks is to help you ensure that you pass common
manual checks that the CRAN team do that are not automated.

Inspired by
[DavisVaughan/extrachecks](https://github.com/DavisVaughan/extrachecks)
and my own frustration in publishing packages to CRAN.

Additional checks are very welcome via PR.

## Installation

You can install the development version of extrachecks from
[GitHub](https://github.com/) with:

``` r
if (!require("remotes")) install.packages("remotes")
remotes::install_github("JosiahParry/extrachecks")
```

## Example

Run the extra checks.

``` r
extrachecks::extrachecks()
#> ! \\examples missing from: `checks()`, `parse_all_rds()`, and `pkg_root()`
#> ! \\value missing from: `checks()`, `extrachecks()`, `parse_all_rds()`, and `pkg_root()`
#> ! \dontrun used in: `extrachecks()`
#> fetching [ 0 / 2 ]fetching [ 1 / 2 ]                       
#> ✔ All URLs are correct!
```
