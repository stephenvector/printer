$fn=344;

module bracket() {
difference() {
    cube([32,32,40]);
    translate([-1,-1,-1]) cube([21,21,42]);
    translate([10,32,10]) rotate([-90,0,0])  cylinder(h=10,d=9,center=true);
    translate([10,32,30]) rotate([-90,0,0])  cylinder(h=10,d=9,center=true);
    translate([32,10,10]) rotate([0,-90,0])  cylinder(h=10,d=9,center=true);
    translate([32,10,30]) rotate([0,-90,0])  cylinder(h=10,d=9,center=true);
    
    translate([10,32,10]) rotate([-90,0,0])  cylinder(h=100,d=5,center=true);
    translate([10,32,30]) rotate([-90,0,0])  cylinder(h=100,d=5,center=true);
    translate([32,10,10]) rotate([0,-90,0])  cylinder(h=100,d=5,center=true);
    translate([32,10,30]) rotate([0,-90,0])  cylinder(h=100,d=5,center=true);
}

}

bracket();

translate([0,32,72]) rotate([-90,0,0])  bracket();

translate([32,0,72]) rotate([0,90,0])  bracket();


translate([20,0,40]) cube([12,32,12]);

translate([0,20,40]) cube([32,12,12]);

translate([20,20,40]) cube([12,12,32]);


translate([32,20,40]) rotate([-90,0,0]) linear_extrude(12) polygon([
  [0,0],
  [40,0],
  [0,40]
]);

translate([20,32,40]) rotate([0,90,0]) linear_extrude(12) polygon([
  [0,0],
  [40,0],
  [0,40]
]);

translate([32,32,40]) linear_extrude(12) polygon([  [0,0],
  [40,0],
  [0,40]]);