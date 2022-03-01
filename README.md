# pastepath
 RStudio addin to paste file paths from Windows Explorer into an R script. The motivation for this is that file paths copied from Explorer have backslashes which have to be replaced with double backslashes or forward slashes to be read by R.
 
# Installation

`remotes::install_github("jonathanaron/pastepath")`

# Use

Once installed (you may have to restart RStudio) you will be able to access the 'Format file path' addin from the "Addins" dropdown in RStudio. For convenience, you may want to map the addin to a keyboard shortcut (Tools -> Modify Keyboard Shortcuts). Ctrl+Shift+V seems like a logical choice unless you already have something else mapped to it.

There are two ways to use the addin: 
1. Use the "Copy path" button in Windows explorer (or copy the text in the navigation bar), place the cursor in your R script, then execute the addin.
2. Highlight an existing (set of) path(s) in an R script and execute the addin to convert them all to well-formatted file paths.

Another useful feature is that if the path you are converting is a child of your working directory then the output will be relative instead of absolute, and uses the `file.path` function to generate platform-agnostic paths.
