test_that("getquintiles() returns 1-10 for sequence 1-10", {
  expect_equal(getquintiles(seq(1, 5, 1)), seq(1, 5, 1))
  expect_equal(getquintiles(seq(5, 1, -1)), seq(5, 1, -1))
  expect_equal(getquintiles(seq(-5, -1, 1)), seq(1, 5, 1))
})

test_that("getquintiles() returns values for a short sequence input",
          expect_equal(is.na(getquintiles(seq(1, 3, 1)))[1], FALSE)
)

test_that("getquintiles() doesn't return error for missing values",
          expect_equal(getquintiles(c(1, 2, NA)), c(1, 5, NA))
)

test_that("getquintiles() applies weights", {
  expect_equal(getquintiles(seq(1, 5, 1), rep(1, 5)), seq(1, 5, 1))
  expect_equal(getquintiles(seq(1, 10, 1), c(rep(NA, 5), rep(1, 5))),
               c(rep(1, 5), seq(1, 5, 1)))
})

test_that("getquintiles() returns error for character input", {
  expect_error(getquintiles("hello"))
  expect_error(getquintiles(NA))
})



