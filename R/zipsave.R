#' Zips and saves all files of specified types within specified subdirectories to a different folder
#'
#' @param dirs vector that lists subfolders to zip
#' @param origin folder where the subfolders sit in
#' @param destination where to save the zip file
#' @param pattern what file types to save (usually small files)
#' @param exceptions any subsubfolders to exclude
#' @param keep how many zipfiles to keep until the oldest gets deleted
#'
#' @return returns message stating how many files have been zipped and where they have been saved
#' @export
#'
#' @examples
#' dir.create("some_test_folders_for_zipsaving")
#' file.create("some_test_folders_for_zipsaving/file1.R")
#' zipsave(dirs = "some_test_folders_for_zipsaving",
#'         origin = getwd(),
#'         destination = paste0(getwd(), "/zipfiles"))
zipsave <- function(dirs,
                    origin,
                    destination,
                    pattern = ".R|.Rmd|.Rproj|.html|.css|.yml",
                    exceptions = "website/_site",
                    keep = 100) {

  old_wd <- getwd()
  backup_destination <- destination
  backup_origin_dirs = dirs

  setwd(origin)

  # If destination folder doesn't exist, create it
  ifelse(!dir.exists(file.path(destination)), dir.create(file.path(destination)), FALSE)

  files_to_backup <- vector()

  for (dir in backup_origin_dirs) {
    files <- list.files(dir,
                        pattern = pattern,
                        recursive = TRUE,
                        include.dirs = TRUE)

    # remove files in exceptions argument
    for (notthisdir in exceptions) {
      files <- files[!startsWith(files, notthisdir)]
      files <- paste0(dir, "/", files)
    }

    files_to_backup <- c(files_to_backup, files)
  }

  # get filenames from backup folder and extract indices
  existing_backups <- list.files(backup_destination)
  existing_backups <- existing_backups[startsWith(existing_backups, "zip")]

  if (length(existing_backups) == 0) {
    indices <- 0
  } else {
    indices <- substr(existing_backups, 4L, 7L)
  }

  latest_index <- as.numeric(indices[length(indices)])
  new_index <- sprintf("%04d", latest_index + 1)

  # delete old backups

  if (length(existing_backups) == 0) {
    backups <- 0
  } else {
    backups <- length(existing_backups)
  }

  oldest_index <- as.numeric(indices[1])

  while (backups >= keep) {
    file.remove(paste0(backup_destination, "/zip", oldest_index, ".zip"))
    backups <- backups - 1
    oldest_index <- oldest_index + 1
  }

  zip::zip(zipfile = paste0(backup_destination, "/zip", new_index, ".zip"),
           files = files_to_backup,
           recurse = TRUE,
           include_directories = TRUE)

  print(paste0(length(files_to_backup), " files have been saved from ", origin, " to ", backup_destination, "/zip", new_index, ".zip"))

  setwd(old_wd)
}
