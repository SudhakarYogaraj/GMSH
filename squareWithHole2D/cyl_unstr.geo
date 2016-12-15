//--------------------------------------------------------------------
// Generate unstructured mesh over a channel with a hole
// The channel dimensions --- [-1,1]*[-1,1]
// Hole is located at (0,0) with diameter 1
//
// Author : Sudhakar
// sudhakar.yogaraj@mech.kth.se
//--------------------------------------------------------------------

// lc defines the mesh size at the point
lc = 0.05;

// Define points and lines connecting them
// Remember the line has sign depending on the 
// order in which the points are connected
// Points used to create the outer box
Point(1) = {-1, -1, 0, lc};
Point(2) = {1, -1, 0, lc} ;
Point(3) = {1, 1, 0, lc} ;
Point(4) = {-1, 1, 0, lc} ;

// points for hole-1
Point(5) = {0, 0, 0, lc*0.25} ;
Point(6) = {0.3536, 0.3536, 0, lc*0.25} ;
Point(7) = {-0.3536, 0.3536, 0, lc*0.25} ;
Point(8) = {-0.3536, -0.3536, 0, lc*0.25} ;
Point(9) = {0.3536, -0.3536, 0, lc*0.25} ;

// create lines correspongin to box
Line(1) = {1,2} ;
Line(2) = {2,3} ;
Line(3) = {3,4} ;
Line(4) = {4,1} ;

// create circular arcs for hole-1
// Remember: In GMSH, the maximum angle of the
// circular arc is PI. So in order to conveniently
// create a circle we use four points
Circle(101) = {6,5,7};
Circle(102) = {7,5,8};
Circle(103) = {8,5,9};
Circle(104) = {9,5,6};

// To define a surface, line loop has to be defined
Line Loop(11) = {1,2,3,4} ;                 // box
Line Loop(12) = {-101,-102,-103,-104};      // hole-1

// Define the surface
// A surface with N holes is defined with N+1 line loops, in which
// the first one defines the outer part and the remaining 
// refers to the holes
Plane Surface(6) = {11,12} ;

Physical Line(1) = {4};                                                // left
Physical Line(2) = {1};                                                // bottom 
Physical Line(3) = {2};                                                // right
Physical Line(4) = {3};                                                // top
Physical Line(5) = {101,102,103,104,105};  // cylinder surfaces

Physical Surface(1) = {6};
