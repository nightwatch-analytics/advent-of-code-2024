check_reports <- function(x) {
  x %>%
    group_by(id) %>%
    mutate(rating_val = case_when(
      (abs(prog) >= 1 & abs(prog) <= 3) & (all(prog > 0) | all(prog < 0)) ~ 0,
      .default = 1
      )
    )%>%
    summarise(total = sum(rating_val)) %>%
    mutate(rating = case_when(
      total == 0 ~ "safe",
      .default = "unsafe"
    ))
}
