## -*- texinfo -*-
## This method return the new stitched image from two images (grayscale)
## Input : first image, second image, 2D homography matrix
## Output : new image after stiching
##
## Author: Ashish Pandey
## Keywords: Stitch Image
function bestImage = stitchImageWithBestH(image1, image2, Hbest)
  im1 = imread(image1);
  im2 = imread(image2);
  bigImage = extendImage(im1, im2, Hbest);
  
  bestImage = fillLargerImage(bigImage, im1, im2, Hbest);

endfunction;
