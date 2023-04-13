test_that("getrollingmean() returns NAs as the first n-1 values", {
  expect_equal(is.na(getrollingmean(c(1, 1, 1), 3)[1]), TRUE)
  expect_equal(is.na(getrollingmean(c(1, 1, 1), 3)[2]), TRUE)
  expect_equal(is.na(getrollingmean(c(1, 1, 1, 1, 1), 5)[3]), TRUE)
  expect_equal(is.na(getrollingmean(c(1, 1, 1, 1, 1), 5)[4]), TRUE)
  expect_equal(is.na(getrollingmean(rep(1, 10), 10)[9]), TRUE)
})

test_that("getrollingmean() returns last value as mean of last n values", {
  expect_equal(getrollingmean(c(1, 1, 1), 3)[3], 1)
  expect_equal(getrollingmean(seq(1, 10, 1), 3)[10], 9)
  expect_equal(getrollingmean(c(-1, 0, 1), 3)[3], 0)
})

test_that("getrollingmean() returns NA for missing values", {
  expect_equal(is.na(getrollingmean(c(NA, 0, 1), 3)[3]), TRUE)
  expect_equal(is.na(getrollingmean(c(1, 1, 1, NA, 0, 1), 3)[3]), FALSE)
})

test_that("getrollingmean() doesn't return NA for missing values is na.rm = TRUE", {
  expect_equal(is.na(getrollingmean(c(NA, 0, 1), 3, na.rm = TRUE)[3]), FALSE)
  expect_equal(getrollingmean(c(NA, 0, 1), 3, na.rm = TRUE)[3], 0.5)

})

test_that("getrollingmean() returns error for inappropriate inputs",
          expect_error(getrollingmean(c("a", "b", "c")))
)



