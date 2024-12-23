read_reports <- function(fPath) {
  read_delim(fPath, col_names = FALSE) %>%
    rowid_to_column("id") %>%
    pivot_longer(!id, names_to = "level",
                 values_to = "value",
                 values_drop_na = TRUE )
}
