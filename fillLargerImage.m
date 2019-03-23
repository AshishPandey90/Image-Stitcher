## -*- texinfo -*-
## This method returns large container image.
## Input : bigImage,im2, Hbest
## Output : bestImage
##
## Author: Ashish Pandey
## Keywords: large container image
function bestImage = fillLargerImage(bigImage, im1, im2, Hbest)
  [m1,n1] = size(im1);
  [m2,n2] = size(im2);
  [bm1,bn1] = size(bigImage);
  
  
  for i=1:1:bm1,
    for j=n1:1:bn1,
       p = [i; j; 1];
       P = Hbest*p;
       P = P./P(3);
        
        X = P(1);
        Y = P(2);
      
      if(X>1 && X<m2 && Y>1 && Y<n2)        
        bigImage(i,j) = (ceil(Y)-Y)*(ceil(X)-X)*im2(floor(X),floor(Y)) + (ceil(Y)-Y)*(X - floor(X))*im2(ceil(X),floor(Y)) + (Y - floor(Y))*(ceil(X)-X)*im2(floor(X), ceil(Y)) + (Y - floor(Y))*(X - floor(X))*im2(ceil(X),ceil(Y));
      endif;
          
    endfor;
  endfor;
    
bestImage = uint8(bigImage);    
      
endfunction;