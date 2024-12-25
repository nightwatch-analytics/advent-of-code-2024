corrupted <- readLines("data/03/corrupted") %>%
  paste0(collapse = "")

process_instructions(corrupted)
