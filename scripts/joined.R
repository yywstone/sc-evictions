# Download: Eviction Lab at Princeton University (https://evictionlab.org/)
# This script joins the two tibbles on city evictions and city boundaries together.

# Author: Stone
# Version: 2020-01-26

# Libraries
library(tidyverse)

# Parameters
# Cities eviction data
file_cities <- here::here("data/cities.rds")
# Cities boundaries data
file_boundaries <- here::here("data/boundaries.rds")
# Output file
file_out <- here::here("data/joined.rds")
# ============================================================================

cities <- read_rds(file_cities)
boundaries <- read_rds(file_boundaries)
cities %>%
  left_join(boundaries, by = c("geoid" = "city_id")) %>%
  write_rds(file_out)
