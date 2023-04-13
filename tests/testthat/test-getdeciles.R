test_that("getdeciles() returns 1-10 for sequence 1-10", {
  expect_equal(getdeciles(seq(1, 10, 1)), seq(1, 10, 1))
  expect_equal(getdeciles(seq(10, 1, -1)), seq(10, 1, -1))
  expect_equal(getdeciles(seq(-10, -1, 1)), seq(1, 10, 1))
})

test_that("getdeciles() returns values for a short sequence input",
          expect_equal(is.na(getdeciles(seq(1, 6, 1)))[1], FALSE)
)

test_that("getdeciles() doesn't return error for missing values",
          expect_equal(getdeciles(c(1, 2, NA)), c(1, 10, NA))
)

test_that("getdeciles() applies weights", {
  expect_equal(getdeciles(seq(1, 10, 1), rep(1, 10)), seq(1, 10, 1))
  expect_equal(getdeciles(seq(1, 20, 1), c(rep(NA, 10), rep(1, 10))),
             c(rep(1, 10), seq(1, 10, 1)))
})

test_that("getdeciles() returns error for character input", {
  expect_error(getdeciles("hello"))
  expect_error(getdeciles(NA))
})



