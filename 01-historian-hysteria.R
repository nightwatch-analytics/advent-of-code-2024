library(fs)
library(tidyverse)

source(dir_ls("R"))

locations <- map(dir_ls("data/01"), read_locID) %>%
  list_rbind(names_to = "file") %>%
  mutate(file = str_extract(file, pattern = "list[0-9]+")) %>%
  pivot_wider(names_from = file,
              values_from = LocationID)
# Distance ####

distance_total <- locations %>%
  mutate(distance = get_dist(list01, list02)) %>%
  summarise(distance = sum(distance))

# Similarity Score ####

similarity <- locations %>%
  filter(list2 %in% list1) %>%
  count(list2) %>%
  mutate(score = list2 * n) %>%
  summarise(score = sum(score))
