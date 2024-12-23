read_reports <- function(path) {
  lines <- readLines(path)
  strsplit(lines, " ") %>%
    lapply(as.integer)
}
