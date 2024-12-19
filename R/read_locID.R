read_locID <- function(x) {
  read_csv(x) %>%
    arrange(LocationID) %>%
    rowid_to_column()
}
