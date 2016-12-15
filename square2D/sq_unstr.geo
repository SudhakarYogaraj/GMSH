//--------------------------------------------------------------------
// Generate unstructured mesh over the domain [0,1]*[0,1]
// This mesh is used to solve Poisson equation over the domain
// using Freefem++
//
// Author : Sudhakar
// sudhakar.yogaraj@mech.kth.se
//--------------------------------------------------------------------

// lc defines the mesh size at the point
lc = 0.05;

// Define points and lines connecting them
// Remember the line has sign depending on the 
// order in which the points are connected
Point(1) = {0, 0, 0, lc};
Point(2) = {1, 0, 0, lc} ;
Point(3) = {1, 1, 0, lc} ;
Point(4) = {0, 1, 0, lc} ;

Line(1) = {1,2} ;
Line(2) = {2,3} ;
Line(3) = {3,4} ;
Line(4) = {4,1} ;

// To define a surface, line loop has to be defined
Line Loop(5) = {1,2,3,4} ;

// Define the surface
Plane Surface(6) = {5} ;

// For this simple example we need not define the physical entities
// The ids that are used to create the geometry is convenient enough.
// However in order to be consistent with the other complex examples, we
// go ahead with creating physical lines.
// The line numbers 1-2-3-4 denote left-bottom-right-top boundaries
Physical Line(1) = {4};
Physical Line(2) = {1};
Physical Line(3) = {2};
Physical Line(4) = {3};

Physical Surface(5) = {6};
