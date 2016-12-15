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

// create lines connecting corner points of the box to
// the cylinder surface
Line(5) = {6,3};
Line(6) = {7,4};
Line(7) = {8,1};
Line(8) = {9,2};

// To define a surface, line loop has to be defined
Line Loop(11) = {1,-8,-103,7};              // bottom     
Line Loop(12) = {2,-5,-104,8};              // right
Line Loop(13) = {3,-6,-101,5};              // top
Line Loop(14) = {4,-7,-102,6};              // top

// Define the surfaces
Plane Surface(1) = {11} ;
Plane Surface(2) = {12} ;
Plane Surface(3) = {13} ;
Plane Surface(4) = {14} ;

Transfinite Line{1,2,3,4,101,102,103,104} = 20; // number of points along the periphery
Transfinite Line{5,6,7,8} = 20 Using Progression 1.2; // number of points along radial direction

Transfinite Surface{1} = {1,2,9,8};
Transfinite Surface{2} = {2,3,6,9};
Transfinite Surface{3} = {3,4,7,6};
Transfinite Surface{4} = {4,1,8,7};

Recombine Surface{1,2,3,4};


Physical Line(1) = {4};                                                // left
Physical Line(2) = {1};                                                // bottom 
Physical Line(3) = {2};                                                // right
Physical Line(4) = {3};                                                // top
Physical Line(5) = {101,102,103,104,105};  // cylinder surfaces

Physical Surface(1) = {1,2,3,4};
