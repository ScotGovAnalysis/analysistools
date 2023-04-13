#' Get rolling mean of last n values in vector
#'
#' @param input_vector variable
#' @param n number of values to take mean of
#' @param na.rm option to remove missing values before taking mean
#'
#' @return vector with rolling mean of last n (optional: non-missing) values
#' @export
#'
#' @examples getrollingmean(seq(1, 10, 1), 3)
getrollingmean <- function(input_vector, n = 3, na.rm = FALSE) {

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



  if (na.rm == TRUE) {

    missing_vector <- is.na(input_vector)
    input_vector[missing_vector] <- 0
    missing_vector <- as.numeric(missing_vector)
    x <- missing_vector

  } else {

    missing_vector <- rep(0, length(input_vector))
    x <- missing_vector

    }

  y <- input_vector


  for (i in 1:(n - 1)) {

    y <- y + c(rep(NA, i), utils::head(input_vector, -i))
    x <- x + c(rep(1, i), utils::head(missing_vector, -i))

  }

  y/(n - x)

}




