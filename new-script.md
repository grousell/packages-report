new-script.R
================
gregrousell
2020-01-27

``` r
## how jenny might do this in a first exploration
## purposely leaving a few things to change later!
```

Which libraries does R search for
    packages?

``` r
.libPaths()
```

    ## [1] "/Library/Frameworks/R.framework/Versions/3.6/Resources/library"

``` r
## let's confirm the second element is, in fact, the default library
.Library
```

    ## [1] "/Library/Frameworks/R.framework/Resources/library"

``` r
identical(.Library, .libPaths()[2])
```

    ## [1] FALSE

``` r
## Huh? Maybe this is an symbolic link issue?
library(fs)
identical(path_real(.Library), path_real(.libPaths()[2]))
```

    ## [1] FALSE

Installed packages

``` r
library(tidyverse)
```

    ## ── Attaching packages ───────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.2.1     ✓ purrr   0.3.3
    ## ✓ tibble  2.1.3     ✓ dplyr   0.8.3
    ## ✓ tidyr   1.0.2     ✓ stringr 1.4.0
    ## ✓ readr   1.3.1     ✓ forcats 0.4.0

    ## ── Conflicts ──────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
ipt <- installed.packages() %>%
  as_tibble()

## how many packages?
nrow(ipt)
```

    ## [1] 160

``` r
# Adding some new lines 

# Some new analyses

df <- iris

df %>% group_by(Species) %>% summarise (Sepal.Length = mean (Sepal.Length),
                                        Sepal.Width = mean (Sepal.Width))
```

    ## # A tibble: 3 x 3
    ##   Species    Sepal.Length Sepal.Width
    ##   <fct>             <dbl>       <dbl>
    ## 1 setosa             5.01        3.43
    ## 2 versicolor         5.94        2.77
    ## 3 virginica          6.59        2.97

``` r
df %>% group_by(Species) %>% summarise (Sepal.Length = mean (Sepal.Length),
                                        Sepal.Width = mean (Sepal.Width)) %>% 
  ggplot (aes (x = Species,
               y = Sepal.Length)) + 
  geom_col ()
```

![](new-script_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->
