## -*- texinfo -*-
## This method returns Hbest, allHs from 2 images.
## Input : image1,image2
## Output : Hbest, allHs
##
## Author: Ashish Pandey
## Keywords: 2d Homography, inliers
function [Hbest, allHs] = getBestHomographyMarix(image1,image2);
   [num loc1 loc2 match] = match(image1, image2);
   display("Total matching keypoints are: ");
   display(num);
   
   
   #lets calculate homography 100 times
   countHomos = 1500;
   #myArray = zeros(3,3,countHomos);
   
  for i = 1:1:countHomos;
     indexes = giveDistinctIndexes(4, num);
     store = giveMatchKeyPoints(match);
     A = getHomography(loc1,loc2,indexes,store);
     H = getHomographyMatrixHomogeneous(A);
     allHs(:,:,i) = H;
   endfor;
   
   Hbest = applyRansac(allHs, store, loc1, loc2);
endfunction;
