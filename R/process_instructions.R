process_instructions <- function(input) {
pattern <- "mul\\(\\d+,\\d+\\)|do\\(\\)|don't\\(\\)"
# find do(), don't(), and mul() instructions
tokens <- str_match_all(input, pattern) %>%
  unlist()

enabled <- TRUE  # mul instructions are enabled at start
results <- numeric()  # initialize results vector

# for each token, enable or disable mul() and execute
for (token in tokens) {
  if (grepl("do\\(\\)", token)) {
    # enable future mul
    enabled <- TRUE
  } else if (grepl("don't\\(\\)", token)) {
    # Disable future mul instructions
    enabled <- FALSE
  } else if (grepl("mul\\((\\d+),(\\d+)\\)", token) && enabled) {
    # execute mul() if enabled
    results <- c(results, eval(parse(text = token)))
  }
}

# total sum of results
sum(results)
}
