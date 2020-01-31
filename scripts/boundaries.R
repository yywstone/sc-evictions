# Download: Eviction Lab at Princeton University (https://evictionlab.org/)
# This script reads in the city boundaries data for South Carolina.

# Author: Stone
# Version: 2020-01-26

# Libraries
library(tidyverse)

# Parameters
# Input file
file_in <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"
# Output file
file_out <- here::here("data/boundaries.rds")
# Raw file
file_raw <- here::here("data-raw/boundaries.rds")
# Col names
vars_rename <-
  c(
    city_id = "GEOID",
    city_name = "n",
    geometry = "geometry"
  )

# ============================================================================
file_in %>%
  sf::read_sf() %>%
  select(vars_rename) %>%
  mutate(city_id = as.double(city_id)) %>%
  write_rds(file_out, compress = "gz")
file_in %>%
  download.file(file_raw)
