test_that("getrollingtotal() creates NAs for first n-1 values", {
  expect_equal(is.na(getrollingtotal(c(1, 1, 1), 3)[1]), TRUE)
  expect_equal(is.na(getrollingtotal(c(1, 1, 1), 3)[2]), TRUE)
  expect_equal(is.na(getrollingtotal(c(1, 1, 1, 1, 1), 5)[3]), TRUE)
  expect_equal(is.na(getrollingtotal(c(1, 1, 1, 1, 1), 5)[4]), TRUE)
  expect_equal(is.na(getrollingtotal(rep(1, 10), 10)[9]), TRUE)
})

test_that("getrollingtotal() returns total of last n values as last value", {
  expect_equal(getrollingtotal(c(1, 1, 1), 3)[3], 3)
  expect_equal(getrollingtotal(seq(1, 10, 1), 3)[10], 27)
  expect_equal(getrollingtotal(c(-1, 0, 1), 3)[3], 0)
})

test_that("getrollingtotal() returns missing values for missing values", {
  expect_equal(is.na(getrollingtotal(c(NA, 0, 1), 3)[3]), TRUE)
  expect_equal(is.na(getrollingtotal(c(1, 1, 1, NA, 0, 1), 3)[3]), FALSE)
})

test_that("getrollingtotal() doesn't return missing values for missing values if na.rm is TRUE", {
  expect_equal(is.na(getrollingtotal(c(NA, 0, 1), 3, na.rm = TRUE)[3]), FALSE)
})

test_that("getrollingtotal() returns error for inappropriate input type",
          expect_error(getrollingtotal(c("a", "b", "c"))))


