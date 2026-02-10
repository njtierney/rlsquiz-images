#!/usr/bin/env Rscript
# Run this script whenever you add new images to rebuild the index

library(tools)

base_dir <- "."
valid_ext <- c("jpg", "jpeg", "png", "webp", "JPG")

# Find all image files
sources <- list.dirs(base_dir, full.names = FALSE, recursive = FALSE)
sources <- sources[!sources %in% c(".git", ".github")]

all_images <- data.frame(
  source = character(),
  species = character(),
  filename = character(),
  stringsAsFactors = FALSE
)

for (src in sources) {
  src_path <- file.path(base_dir, src)
  if (!dir.exists(src_path)) next
  
  species_dirs <- list.dirs(src_path, full.names = FALSE, recursive = FALSE)
  
  for (sp in species_dirs) {
    sp_path <- file.path(src_path, sp)
    files <- list.files(sp_path, full.names = FALSE)
    files <- files[tolower(file_ext(files)) %in% valid_ext]
    
    if (length(files) > 0) {
      all_images <- rbind(all_images, data.frame(
        source = src,
        species = sp,
        filename = files,
        stringsAsFactors = FALSE
      ))
    }
  }
}

# Write the index
write.csv(all_images, "index.csv", row.names = FALSE)
cat("Index built:", nrow(all_images), "images\n")
