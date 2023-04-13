#' Get rolling total of last n values in vector
#'
#' @param input_vector input vector
#' @param n number of values to total
#' @param na.rm option to remove missing values before taking mean
#'
#' @return vector with rolling total of last n (optional: non-missing) values
#' @export
#'
#' @examples getrollingtotal(seq(1, 10, 1), 3)
getrollingtotal <- function(input_vector, n = 3, na.rm = FALSE) {

  if (!is.vector(input_vector)) {
    stop("Input must be a vector")
  }

  if (length(input_vector) == 0) {
    stop("Input vector must be non-zero length")
  }

  if (length(input_vector) < n) {
    stop("Input vector must be as least as long as n")
  }

  if (!(is.numeric(input_vector) | is.integer(input_vector))) {
    stop("Input vector must be a numeric or integer")
  }

  if (na.rm == TRUE) {input_vector[is.na(input_vector)] <- 0}

  y <- input_vector

  for (i in 1:(n - 1)) {

    y <- y + c(rep(NA, i), utils::head(input_vector, -i))

    }
  y
}

