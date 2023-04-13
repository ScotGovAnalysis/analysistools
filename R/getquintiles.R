#' Get quintile vector
#'
#' Get quintile vector based on input vector
#' (for optional weights argument see Hmisc package)
#'
#' @param var input vector
#' @param ... use for weights and other arguments see Hmisc package
#'
#' @return quintile vector
#' @export
#'
#' @examples getquintiles(sample(100), weights = rep(1, 100))
#'
getquintiles <- function(var, ...) {

  if (length(var) == 0) {
    stop("Input vector must be non-zero length")
  }

  if (!(is.numeric(var) | is.integer(var))) {
    stop("Input vector must be a numeric or integer")
  }

  probs <- seq(0.2, 1, 0.2)
  decs <- Hmisc::wtd.quantile(x = var, probs = probs, ...)
  out <- vector(length = length(var))

  for (i in 1:length(var)) {
    if (is.na(var[i])) {
      out[i] <- NA
    } else {
      if (var[i] <= decs[1]) {out[i] <- 1}
      if (var[i] <= decs[2] & var[i] > decs[1]) {out[i] <- 2}
      if (var[i] <= decs[3] & var[i] > decs[2]) {out[i] <- 3}
      if (var[i] <= decs[4] & var[i] > decs[3]) {out[i] <- 4}
      if (var[i] > decs[4]) {out[i] <- 5}
    }
  }
  out

}

