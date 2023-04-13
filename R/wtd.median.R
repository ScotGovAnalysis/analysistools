#' Get median (for optional weights argument see Hmisc package)
#'
#' @param var input vector
#' @param ... use for weights and any other arguments see Hmisc package
#'
#' @return median value
#' @export
#'
#' @examples wtd.median(seq(1, 100, 1), weights = rep(1, 100))
#'
wtd.median <- function(var, ...) {

  if (length(var) == 0) {
    stop("Input vector must be non-zero length")
  }

  if (!(is.numeric(var) | is.integer(var))) {
    stop("Input vector must be a numeric or integer")
  }

  out <- Hmisc::wtd.quantile(var, probs = 0.5, ...)

  attr(out, "names") <- NULL

  out

}

