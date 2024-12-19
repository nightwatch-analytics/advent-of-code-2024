library(fs)
library(tidyverse)

source(dir_ls("R"))

locations <- map(dir_ls("data"), read_locID) %>%
  list_rbind(names_to = "file") %>%
  mutate(file = str_remove(file, pattern = "data/01-")) %>%
  mutate(file = str_remove(file, pattern = "\\.csv")) %>%
  pivot_wider(names_from = file,
              values_from = LocationID)
# Distance ####

distance_total <- locations %>%
  mutate(distance = get_dist(list1, list2)) %>%
  summarise(distance = sum(distance))

# Similarity Score ####

similarity <- locations %>%
  filter(list2 %in% list1) %>%
  count(list2) %>%
  mutate(score = list2 * n) %>%
  summarise(score = sum(score))
