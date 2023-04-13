
if (!dir.exists("some_test_folders_for_zipsaving")) {
  dir.create("some_test_folders_for_zipsaving")
  file.create("some_test_folders_for_zipsaving/file1.R")
}

test_that("zipsave prints message", {
  expect_output(zipsave(dirs = "some_test_folders_for_zipsaving",
                         origin = getwd(),
                         destination = paste0(getwd(), "/zipfiles")),
                 "files have been saved from")
})

unlink("some_test_folders_for_zipsaving", recursive = TRUE)
unlink("zipfiles", recursive = TRUE)
