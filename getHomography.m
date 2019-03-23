## -*- texinfo -*-
## This method returns A from 4 pair of corresspondng matches.
## Input : loc1, loc2, distinct 4 indexes, store
## Output : A
##
## Author: Ashish Pandey
## Keywords: 2d Homography
## we assume here that length of idexes will be 4
function A = getHomography(loc1,loc2,indexes,store);
     p1P1 = store(indexes(1),:);
     p2P2 = store(indexes(2),:);
     p3P3 = store(indexes(3),:);
     p4P4 = store(indexes(4),:);
     
     
     p1 = loc1(p1P1(1),:);
     P1 = loc2(p1P1(2),:);
     
     p2 = loc1(p2P2(1),:);
     P2 = loc2(p2P2(2),:);
     
     p3 = loc1(p3P3(1),:);
     P3 = loc2(p3P3(2),:);
     
     p4 = loc1(p4P4(1),:);
     P4 = loc2(p4P4(2),:);

x1 = p1(1);
y1 = p1(2);

X1 = P1(1); 
Y1 = P1(2);

x2 = p2(1);
y2 = p2(2);

X2 = P2(1);
Y2 = P2(2);

x3 = p3(1);
y3 = p3(2);

X3 = P3(1);
Y3 = P3(2);

x4 = p4(1);
y4 = p4(2);

X4 = P4(1);
Y4 = P4(2);

#display(x1 y1 x2 y2 x3 y3 x4 y4);
#display(x1);

A = [0, 0, 0, -x1, -y1, -1, x1*Y1, y1*Y1, Y1; x1, y1, 1, 0, 0, 0, -x1*X1, -y1*X1, -X1; 0, 0, 0, -x2, -y2, -1, x2*Y2, y2*Y2, Y2; x2, y2, 1, 0, 0, 0, -x2*X2, -y2*X2, -X2; 0, 0, 0, -x3, -y3, -1, x3*Y3, y3*Y3, Y3; x3, y3, 1, 0, 0, 0, -x3*X3, -y3*X3, -X3; 0, 0, 0, -x4, -y4, -1, x4*Y4, y4*Y4, Y4; x4, y4, 1, 0, 0, 0, -x4*X4, -y4*X4, -X4];

endfunction;
