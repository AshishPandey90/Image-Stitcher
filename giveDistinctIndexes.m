## -*- texinfo -*-
## This method returns give distinct number of indexes in a range of number
## Input : no. of indexes, range
## Output : distinct indexes array
##
## Author: Ashish Pandey
## Keywords: Unique indexes, Distinct
function indexes = giveDistinctIndexes(num, length);
  if(length<num);
    display("range given is smaller than the number count");
  else
    randomNums = floor( 1 +  (length-1)*rand(1,num) );
    
    indexes = unique(randomNums);
    
    while (size(indexes,2) < num);
      randomNums = floor( 1 +  (length-1)*rand(1,num) );
      indexes = unique(randomNums);
    endwhile;
  endif;
  
endfunction;
