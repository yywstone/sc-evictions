# Download: Eviction Lab at Princeton University (https://evictionlab.org/)
# This script reads in the city eviction data for South Carolina.

# Author: Stone
# Version: 2020-01-26

# Libraries
library(tidyverse)

# Parameters
# Input file
file_in <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"
# Output file
file_out <- here::here("data/citis.rds")
# Raw file
file_raw <- here::here("data-raw/cities.rds")
# Col names
vars_rename <-
  c(
    geoid = "GEOID",
    year = "year",
    name = "name",
    evictions = "evictions"
  )
# Col types
vars_type <-
  cols_only(
    GEOID = col_double(),
    year = col_double(),
    name = col_character(),
    evictions = col_double()
  )
# ============================================================================
file_in %>%
  vroom::vroom(col_types = vars_type) %>%
  rename(!!! vars_rename) %>%
  filter(year == 2016) %>%
  write_rds(file_out, compress = "gz")
file_in %>%
  download.file(file_raw)
