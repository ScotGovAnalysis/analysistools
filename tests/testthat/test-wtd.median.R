test_that("wtd.median() returns correct value", {
  expect_equal(wtd.median(seq(1, 10, 1)), 5.5)
  expect_equal(wtd.median(seq(-10, -1, 1)), -5.5)
})

test_that("wtd.median() doesn't return error for missing values",
          expect_equal(wtd.median(c(1, 2, NA)), 1.5))

test_that("wtd.median() applies weights correctly", {
  expect_equal(wtd.median(seq(1, 10, 1), rep(1, 10)), 5.5)
  expect_equal(wtd.median(seq(1, 20, 1), c(rep(NA, 10), rep(1, 10))), 15.5)
  })

test_that("wtd.median() returns error for character input", {
  expect_error(wtd.median("hello"))
  expect_error(wtd.median(NA))
  expect_error(wtd.median(rep(NA, 3)))
})



