// Resolution
$fn=50;
 
sphereDiameter = 44;
bowlDiameter = 42;
thicknessofBowl = 2;

radiusofSphere = sphereDiameter/2;
radiusofBowl = bowlDiameter/2;

outerSphereDiameter = sphereDiameter + (thicknessofBowl*2);
outerSphereRadius = outerSphereDiameter/2;


heightofBowl = (sphereDiameter-(sqrt((radiusofSphere*radiusofSphere)-(radiusofBowl*radiusofBowl)))
)/2;
echo(heightofBowl);
heightofBowlCutPlane = heightofBowl+thicknessofBowl;

translate([0,0,outerSphereRadius]){
  difference() {
    difference() {
      // Outer Ball
      sphere(d=outerSphereDiameter); 
      
	//Inner Ball
	sphere(d=sphereDiameter); 
      }
    
    translate(v=[0,0,heightofBowlCutPlane]) {
      // Cutting cube
      cube(size = [outerSphereDiameter,outerSphereDiameter,outerSphereDiameter], center = true);
    }
  }
}

// Credit goes to Maria Decker for the maths to calculate the cut plane offset. (unless it's wrong...then it's probably just my implementation)
