//--------------------------------------------------------------------
// Generate non-unifrm mesh over the line (-1,0)--(1,0)
//
// Author : Sudhakar
// sudhakar.yogaraj@mech.kth.se
//--------------------------------------------------------------------

// lc defines the mesh size at the points
lc1 = 0.005;
lc2 = 0.35;

// Define points and lines connecting them
// Remember the line has sign depending on the 
// order in which the points are connected
Point(1) = {-1, 0, 0, lc1};
Point(2) = {0, 0, 0, lc2} ;
Point(3) = {1, 0, 0, lc1} ;

Line(1) = {1,2} ;
Line(2) = {2,3} ;

