## -*- texinfo -*-
## This method returns number of inliers for a H after checking for all keypoints.
## Input : H,store,loc1,loc2, threshold
## Output : number of inliers
##
## Author: Ashish Pandey
## Keywords: 2d Homography, inliers
function inliersH = getHinliers(H,store,loc1,loc2, threshold)
 inliersH = 0;
 totalKeys = length(store);
 
  for i =1:1:totalKeys
      p = store(i,1);
      P = store(i,2);
      
      #these are coordinates of point in first image
      x = loc1(p,1);
      y = loc1(p,2);
      
      #these are coordinates of point in second image
      X = loc2(P,1);
      Y = loc2(P,2);
      
      # H is forward matrix from first image to second image;
      # invH is backward matrix from second image to first image;
      invH = inv(H);
      
      forwardDist = pointDifference(X,Y, x,y, H);
     
      backwardDist = pointDifference(x,y, X,Y, invH);
     
      totalDist = forwardDist + backwardDist;
      #display("totalDist : ");
      #display(totalDist);
      
      if(totalDist < threshold);
        inliersH = inliersH + 1;
      endif;
           
  endfor;

endfunction;
