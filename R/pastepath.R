#' Format text as a file path
#'
#'
#' @param text String. If not supplied this function reads the clipboard
#'
#' @return A well-formatted file path. When the file path is downstream of the
#' current working directory, a string representing a call to `file.path` with
#' a relative path is returned. Otherwise, the absolute file path is returned
#' @export
format_path <- function(text = character(0)) {

  if (length(text) == 0 | identical(text, "")) {
    text <- utils::readClipboard()
  }

  path <- gsub("\\", "/", text, fixed = TRUE)
  path <- gsub('"', "", path)

  split_path <- strsplit(path, "/")[[1]]

  wd <- getwd()

  split_wd <- strsplit(wd, "/")[[1]]

  if (length(setdiff(split_wd, split_path)) == 0 &&
      length(setdiff(split_path, split_wd)) > 0) {
    split_path <- setdiff(split_path, split_wd)
    out <- paste0("file.path(", paste0(shQuote(split_path), collapse = ", "), ")")
  } else {
    out <- shQuote(paste0(split_path, collapse = "/"))
  }

  return(out)

}

#' RStudio add-in function to convert a string to a well-formatted file path
#' @export
to_path <- function() {
  context <- rstudioapi::getActiveDocumentContext()
  for (con in rev(context$selection)) {
    rstudioapi::modifyRange(con$range,
                            format_path(con$text),
                            context$id)

  }
}
