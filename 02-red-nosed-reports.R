reports <- read_reports("data/02/reports")

reports %>%
  vapply(check_reports, logical(1)) %>%
  sum()

