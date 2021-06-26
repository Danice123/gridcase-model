use <screwbracket.scad>;

union() {
    raisedScrewHole(1);
    translate([22, 0, 0]) raisedScrewHole(1);
    translate([4, 0, 0]) cube([14, 4, 9], false);

    translate([4, 1.25, 6.5]) cube([14, 10.5, 2.5], false);
    translate([11, 8.2, 3]) difference() {
        cylinder(r=3.5, h=6);
        cylinder(r=2.5, h=6);
    }
}