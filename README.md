
# rlsquiz-images

<!-- badges: start -->
<!-- badges: end -->

The goal of rlsquiz-images is to provide an image interface into the rlsquiz repo (https://github.com/njtierney/rlsquiz), to help decouple the images from the R package/shiny app.

When you update any images in these folders, a github action will update the index automatically. If this doesn't seem to work or happen, then you can run the following instead:

```r
source("write_image_index.R")
```

Which will rebuild `index.csv`, the index of all images.