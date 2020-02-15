// Input Variables
thickness=6;
size=60;
extrusion=20;
screwDiameter=4;
screwCapDiameter=7;
screwCapInset=4; // Make this less than thickness by at least a millimeter or two

$fa=0.1;
$fs=0.1;
$fn=200;

// Calculated/Generated Variables
holeOffset=thickness+extrusion/2;
hole2XY=thickness+size/2;
hole3XY=thickness+size-extrusion/2;

module bracket_side() {
    difference() {
        linear_extrude(height=thickness) {
            polygon([
                [0,0],
                [0,size + thickness],
                [extrusion+thickness,size + thickness],
                [size + thickness,extrusion + thickness],
                [size + thickness,0]
            ]);
        }
        translate([holeOffset, holeOffset, 0]) cylinder(d=screwDiameter,h=99);
        translate([holeOffset, hole3XY,    0]) cylinder(d=screwDiameter,h=99);
        translate([holeOffset, hole2XY,    0]) cylinder(d=screwDiameter,h=99);
        translate([hole2XY,    holeOffset, 0]) cylinder(d=screwDiameter,h=99);
        translate([hole3XY,    holeOffset, 0]) cylinder(d=screwDiameter,h=99);
        
        translate([0,0,-1]) {
            translate([holeOffset, holeOffset, 0]) cylinder(d=screwCapDiameter,h=screwCapInset+1);
            translate([holeOffset, hole3XY,    0]) cylinder(d=screwCapDiameter,h=screwCapInset+1);
            translate([holeOffset, hole2XY,    0]) cylinder(d=screwCapDiameter,h=screwCapInset+1);
            translate([hole2XY,    holeOffset, 0]) cylinder(d=screwCapDiameter,h=screwCapInset+1);
            translate([hole3XY,    holeOffset, 0]) cylinder(d=screwCapDiameter,h=screwCapInset+1);
        }
    }
}

color("#fff")  union() {
    bracket_side();
    rotate([0,-90,-90]) bracket_side();
    mirror([0,1,0]) rotate([0,90,0])  mirror([1,1,0]) bracket_side();
}