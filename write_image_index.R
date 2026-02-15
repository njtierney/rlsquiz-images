# alternative approach using {fs}
library(fs)
library(dplyr)
library(tidyr)

# trying to mimic `all_images` folder
valid_img_types <- c("jpg", "jpeg", "png", "webp", "JPG")
valid_img_reg <- paste0("*.", valid_img_types, collapse = "|")
all_rls_images <- dir_ls(
  path = ".",
  all = TRUE,
  recurse = TRUE,
  glob = valid_img_reg
)

all_rls_images_faster <- tibble(
  all_rls_images
) |>
  separate_wider_delim(
    cols = everything(),
    delim = "/",
    names = c("source", "species", "filename")
  ) |>
  arrange(source, species, filename)

readr::write_csv(all_rls_images_faster, "index.csv")
