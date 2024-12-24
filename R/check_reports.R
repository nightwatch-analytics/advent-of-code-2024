check_reports <- function(x) {
  diffs <- diff(x)
  cond1 <- all(diffs > 0) || all(diffs < 0)
  cond2 <- all(abs(diffs) >= 1) && all(abs(diffs) <= 3)
  cond1 && cond2
}
