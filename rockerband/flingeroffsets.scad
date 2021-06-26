use <screwbracket.scad>;

union() {
    raisedScrewHole(1);
    translate([22, 0, 0]) raisedScrewHole(1);
    translate([4, 0, 0]) cube([14, 4, 1], false);
    translate([4, 0, 0]) cube([14, 2.75, 14], false);
}
