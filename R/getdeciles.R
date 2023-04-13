#' Get decile vector
#'
#' Get decile vector based on input vector
#' (for optional weights argument see Hmisc package)
#'
#' @param var input vector
#' @param ... use for weights and other arguments see Hmisc package
#'
#' @return decile vector
#' @export
#'
#' @examples getdeciles(seq(1, 100, 1), weights = rep(1, 100))
#'
getdeciles <- function(var, ...) {

  if (length(var) == 0) {
    stop("Input vector must be non-zero length")
  }

  if (!(is.numeric(var) | is.integer(var))) {
    stop("Input vector must be a numeric or integer")
  }

  probs <- seq(0.1, 1, 0.1)
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
    if (var[i] <= decs[5] & var[i] > decs[4]) {out[i] <- 5}
    if (var[i] <= decs[6] & var[i] > decs[5]) {out[i] <- 6}
    if (var[i] <= decs[7] & var[i] > decs[6]) {out[i] <- 7}
    if (var[i] <= decs[8] & var[i] > decs[7]) {out[i] <- 8}
    if (var[i] <= decs[9] & var[i] > decs[8]) {out[i] <- 9}
    if (var[i] > decs[9]) {out[i] <- 10}
    }
  }
  out

}

