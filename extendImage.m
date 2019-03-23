## -*- texinfo -*-
## This method returns large container image.
## Input : im1, im2, Hbest
## Output : imageNew
##
## Author: Ashish Pandey
## Keywords: large container image
function imageNew  = extendImage(im1, im2, Hbest)
  [m2,n2] =  size(im2);
  
  C1 = [0;0;1];
  C2 = [0;n2;1];
  C3 = [m2;0;1];
  C4 = [m2;n2;1];
  
  invHbest = inv(Hbest);
  
  c1 = invHbest*C1;
  c2 = invHbest*C2;
  c3 = invHbest*C3;
  c4 = invHbest*C4;
  
  #inhomogeneous coordinates!
  c1 = c1./c1(3);
  c2 = c2./c2(3);
  c3 = c3./c3(3);
  c4 = c4./c4(3);
  
  newCornerRows = [c1(1), c2(1), c3(1), c4(1)];
  newCornerColumns = [c1(2), c2(2), c3(2), c4(2)];
  
  newCornerRowsSorted = ceil(sort(newCornerRows));
  newCornerColumnsSorted = ceil(sort(newCornerColumns)); 
  
  #display(newCornerRowsSorted);
  #display(newCornerColumnsSorted);
  
  [m1,n1] =  size(im1);
  
  if(m1 < newCornerRowsSorted(4))
    im1(newCornerRowsSorted(4), 1) = 255;
  endif

  if(n1 < newCornerColumnsSorted(4))
    im1(1, newCornerColumnsSorted(4)) = 255;
  endif

    imageNew = im1;
endfunction;
