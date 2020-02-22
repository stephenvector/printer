thickness=5;
size=60;
extrusion=20;

$fa=0.1;
$fs=0.1;
$fn=500;

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
        translate([thickness+extrusion/2,thickness+extrusion/2, 0]) cylinder(d=5,h=99,center=true);
        translate([thickness+extrusion/2,thickness+size-extrusion/2, 0]) cylinder(d=5,h=99,center=true);
        translate([thickness+extrusion/2,thickness+size/2, 0]) cylinder(d=5,h=99,center=true);
        translate([thickness+size/2,thickness+extrusion/2, 0]) cylinder(d=5,h=99,center=true);
        translate([thickness+size-extrusion/2,thickness+extrusion/2, 0]) cylinder(d=5,h=99,center=true);
        
        translate([0,0,0]) {
            translate([thickness+extrusion/2,thickness+extrusion/2, 0]) cylinder(d=8,h=3,center=true);
            translate([thickness+extrusion/2,thickness+size-extrusion/2, 0]) cylinder(d=8,h=3,center=true);
            translate([thickness+extrusion/2,thickness+size/2, 0]) cylinder(d=8,h=3,center=true);
            translate([thickness+size/2,thickness+extrusion/2, 0]) cylinder(d=8,h=3,center=true);
            translate([thickness+size-extrusion/2,thickness+extrusion/2, 0]) cylinder(d=8,h=3,center=true);
        }
    }
}

color("#fff")  union() {
    bracket_side();
    rotate([0,-90,-90]) bracket_side();
    mirror([0,1,0]) rotate([0,90,0])  mirror([1,1,0]) bracket_side();
}
