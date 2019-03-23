## -*- texinfo -*-
## This method returns H homography fom A
## Input : A
## Output : H
##
## Author: Ashish Pandey
## Keywords: 2d Homography
function H = getHomographyMatrixHomogeneous(A);
 [U D V] = svd(A);
 Htemp = V(:,9);
 H = transpose(reshape(Htemp,3,3));
endfunction;
