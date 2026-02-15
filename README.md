
# rlsquiz-images

<!-- badges: start -->
<!-- badges: end -->

The goal of rlsquiz-images is to provide an image interface into the rlsquiz repo (https://github.com/njtierney/rlsquiz), to help decouple the images from the R package/shiny app.

When you update any images in these folders, you must run:

```r
source("write_image_index.R")
```

So you can rebuild `index.csv`, which is the index of all images.