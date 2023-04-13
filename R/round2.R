#' Rounds vector
#'
#' Rounds to specified number of places. Rounds 0.5 to
#' nearest digit, not to even digit as round() does.
#' Negative digits are allowed.
#'
#' @param digits integer
#' @param input_vector numeric vector
#'
#' @return rounded numeric vector
#' @export
#'
#' @examples
#' round(.5 + -2:4) # IEEE / IEC rounding
#' round2(.5 + -2:4)
#' round2(1234, -2)
#'
round2 <- function(input_vector, digits = 0) {

    if (length(input_vector) == 0) {
    stop("Input vector must be non-zero length")
  }
  if (!(is.numeric(input_vector) | is.integer(input_vector) | anyNA(input_vector))) {
    stop("Input vector must be a numeric or integer")
  }

  if (!(is.numeric(digits) | is.integer(digits))) {
    stop("Digits must be an integer")
  }
  posneg = sign(input_vector)
  z = abs(input_vector)*10^digits
  z = z + 0.5 + sqrt(.Machine$double.eps)
  z = trunc(z)
  z = z/10^digits
  z*posneg
}
