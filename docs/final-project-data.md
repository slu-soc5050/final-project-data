Creation of 2016 General Social Survey
================
Christopher Prener, Ph.D.
(September 11, 2018)

## Introduction

This notebook imports the full General Social Survey data release from
ICPSR and creates the minimal version needed for the SOC 4015 final
project.

## Dependencies

This notebook requires a number of packages:

``` r
# tidyverse packages
library(dplyr)  # data cleaning
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
# other packages
library(here)   # file path management
```

    ## here() starts at /Users/chris/GitHub/SOC5050/CoreRepos/final-project-data

## Load Data

This notebook requires the raw data to be loaded so that it can be
cleaned:

``` r
load(file = here("data", "36797-0001-Data.rda"))
```

## Subset and Tidy Data

First, we want to limit the years present in our data:

``` r
gss16 <- filter(da36797.0001, YEAR == 2016)
```

Next, we remove variables that were not measured in 2016:

``` r
gss16 <- Filter(function(x) !(all(x=="")), gss16)
```

Then we convert the data to a tibble:

``` r
gss16 <- as_tibble(gss16)
```

## Export Data

Finally, we expor the cleaned up data as a useable object:

``` r
save(gss16, file = here("data", "gss16.rda"))
```
