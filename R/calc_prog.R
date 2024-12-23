calc_prog <- function(x) {

  x %>%
    group_by(id) %>%
    mutate(
      prog = value - lag(value)
  ) %>%
    filter(!is.na(prog))
}
