read_locID <- function(df) {
  read_csv(df) %>%
    arrange(LocationID) %>%
    rowid_to_column()
}
