check_reports <- function(x) {

  safety_check <- function(x) {
    diffs <- diff(x)
    cond1 <- all(diffs > 0) || all(diffs < 0)
    cond2 <- all(abs(diffs) >= 1) && all(abs(diffs) <= 3)
    cond1 && cond2
  }
# Problem dampener
    for (i in seq_along(x)) {
      if (safe(x[-i])) return(TRUE)
    }
    FALSE
}
