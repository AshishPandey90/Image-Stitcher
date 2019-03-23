## -*- texinfo -*-
## This method returns mapping of matching from loc1 to loc2
## Input : match matrix from sift match
## Output : store matrix
##
## Author: Ashish Pandey
## Keywords: Store
function store = giveMatchKeyPoints(match);
  len = size(match,2);
  j = 1;
  for i=1:1:len;
    if(match(i) != 0)
      store(j,:)=[i,match(i)];
      j = j+1;
    endif;
  end;
endfunction;
