## -*- texinfo -*-
## This method returns square of distance between two points
## Input : target coordinates in one image, reference coordinate in other image, 
## 2D homography matrix in other image used to locate reference coordinate in 
## first image.
## Output : square of error distance
##
## Author: Ashish Pandey
## Keywords: error distance
function distSquare = pointDifference(tarX,tarY, refX,refY, refH);
  vec = [refX ; refY ; 1];
  newVec = refH*vec;
  newVecHomogeneous = newVec./newVec(3);
  
  outX = newVecHomogeneous(1);
  outY = newVecHomogeneous(2);
  
  distSquare = (outX-tarX)**2 + (outY-tarY)**2;
  #display("distSquare :");
  #display(distSquare);
endfunction;
