
<!-- README.md is generated from README.Rmd. Please edit that file -->

# analysistools

<!-- badges: start -->

<!-- badges: end -->

The goal of analysistools is to help cleaning and analysing survey data.

## Installation

You can install analysistools with:

``` r
install.packages("path/to/analysistools.zip")
```

## Examples

These are some basic examples which shows you how to solve common
problems:

``` r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(analysistools)

# round2() rounds to nearest, rather than to "even" as round() (IEEE / IEC rounding) does.

a <- seq(-3.5, 3.5, 1)
round(a)
#> [1] -4 -2 -2  0  0  2  2  4
round2(a)
#> [1] -4 -3 -2 -1  1  2  3  4

round2(1234, -2)
#> [1] 1200
round2(1234.5678, 1)
#> [1] 1234.6

b <- seq(1, 100, 1)
wt <- rep(1, 100)
wtd.median(b, weights = wt)
#> [1] 50.5

c <- seq(1, 10, 1)
d <- rep(c(0, 1), 3)
getrollingmean(c, 3)
#>  [1] NA NA  2  3  4  5  6  7  8  9
getrollingmean(d, 2)
#> [1]  NA 0.5 0.5 0.5 0.5 0.5

getrollingtotal(c, 3)
#>  [1] NA NA  6  9 12 15 18 21 24 27
getrollingtotal(d, 2)
#> [1] NA  1  1  1  1  1

iris %>% 
  dplyr::group_by(Species) %>% 
  dplyr::mutate(sepal_length_deciles = getdeciles(Sepal.Length)) %>% 
  dplyr::count(sepal_length_deciles)
#> # A tibble: 29 x 3
#> # Groups:   Species [3]
#>    Species    sepal_length_deciles     n
#>    <fct>                     <dbl> <int>
#>  1 setosa                        1     5
#>  2 setosa                        2     6
#>  3 setosa                        3     5
#>  4 setosa                        4     4
#>  5 setosa                        5     8
#>  6 setosa                        6     8
#>  7 setosa                        8     4
#>  8 setosa                        9     5
#>  9 setosa                       10     5
#> 10 versicolor                    1     5
#> # ... with 19 more rows

e <- c(rep(NA, 50), rep(1, 50))
getdeciles(b, weights = e)
#>   [1]  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1
#>  [26]  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1
#>  [51]  1  1  1  1  1  2  2  2  2  2  3  3  3  3  3  4  4  4  4  4  5  5  5  5  5
#>  [76]  6  6  6  6  6  7  7  7  7  7  8  8  8  8  8  9  9  9  9  9 10 10 10 10 10
```
