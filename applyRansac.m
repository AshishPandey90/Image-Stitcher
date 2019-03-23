## -*- texinfo -*-
## This method returns Hbest after evaluating all homography matrices.
## based on Systemetic transfer error
## Input : allHs, store, loc1, loc2
## Output : Hbest
##
## Author: Ashish Pandey
## Keywords: Hbest, H best
function Hbest = applyRansac(allHs, store, loc1, loc2);
  #lets evaluate each homograph based on half of total keypoint matches
  numMatches = length(store);
  
  #numCheck = floor(num/4);
  #indexes = giveDistinctIndexes(numCheck, num);
  dimensions = size(allHs);
  if(length(dimensions) == 3)
      numHs = dimensions(3);
  else
      numHs = 1;
  endif;
     
  display(numHs);
  
  maxInliers = 0;
  threshold = 1;
  display(threshold);
  
  for i =1:1:numHs;
    H = allHs(:,:,i);
    inliersH = getHinliers(H,store,loc1,loc2,threshold);
    #display(inliersH);
      if(inliersH >= maxInliers)
         maxInliers = inliersH;
         Hbest = H;
      endif;  
  endfor;  
  
  display(maxInliers);
endfunction;
