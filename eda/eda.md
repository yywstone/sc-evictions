city-evictions-eda
================
Stone
2020-01-29

  - [City by eviction number](#city-by-eviction-number)
      - [City with the highest eviction
        number](#city-with-the-highest-eviction-number)

``` r
# Libraries
library(tidyverse)

# Parameters
  # City evictions data
  file_cities <- here::here("data/cities.rds")
  # City boundaries data
  file_boundaries <- here::here("data/boundaries.rds")
  # Joined data
  file_joined <- here::here("data/joined.rds")
#===============================================================================
```

## City by eviction number

``` r
file_cities %>% 
  read_rds() %>% 
  arrange(desc(evictions))
```

    ## # A tibble: 397 x 4
    ##      geoid  year name             evictions
    ##      <dbl> <dbl> <chr>                <dbl>
    ##  1 4550875  2016 North Charleston     3660.
    ##  2 4516000  2016 Columbia             2225.
    ##  3 4513330  2016 Charleston           1546.
    ##  4 4562395  2016 St. Andrews          1383.
    ##  5 4525810  2016 Florence             1097.
    ##  6 4519285  2016 Dentsville            769.
    ##  7 4549075  2016 Myrtle Beach          729.
    ##  8 4501360  2016 Anderson              642.
    ##  9 4532065  2016 Hanahan               529.
    ## 10 4529815  2016 Goose Creek           480.
    ## # … with 387 more rows

### City with the highest eviction number

``` r
file_cities %>% 
  read_rds() %>% 
  top_n(1, evictions)
```

    ## # A tibble: 1 x 4
    ##     geoid  year name             evictions
    ##     <dbl> <dbl> <chr>                <dbl>
    ## 1 4550875  2016 North Charleston     3660.
