test_that("round2() rounds correctly", {
  expect_equal(round2(1.5), 2)
  expect_equal(round2(0.5), 1)
  expect_equal(round2(-0.5), -1)
  expect_equal(round2(-1.5), -2)
})

test_that("round2() returns missing values",
          expect_equal(is.na(round2(NA)), TRUE))

test_that("round2() returns error with character input",
          expect_error(round2("hello")))

