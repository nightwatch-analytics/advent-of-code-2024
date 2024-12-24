reports <- read_reports("data/02/reports")

reports_checked <- reports %>%
  calc_prog()

%>%
  check_reports()

reports_checked %>%
  count(rating)
