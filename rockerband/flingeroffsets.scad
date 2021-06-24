module raisedScrewHole(height) {
    difference() {
        union() {
            cylinder(height, r=4);
            translate([-4, 0, 0]) cube([8, 4, height], false);
        }
        
        // translate([0, 0, 1]) cylinder(2, r=3);
        cylinder(height, r=2);
    }
}

union() {
    raisedScrewHole(1);
    translate([22, 0, 0]) raisedScrewHole(1);
    translate([4, 0, 0]) cube([14, 4, 1], false);
    translate([4, 0, 0]) cube([14, 2.75, 14], false);
}

translate([0, 20, 0]) union() {
    raisedScrewHole(1);
    translate([22, 0, 0]) raisedScrewHole(1);
    translate([4, 0, 0]) cube([14, 4, 1], false);
    translate([4, 1.25, 0]) cube([14, 2.75, 9], false);

    translate([4, 1.25, 6.5]) cube([14, 10, 2.5], false);
    translate([11, 8.4, 3]) difference() {
        cylinder(r=3, h=6);
        cylinder(r=2.5, h=6);
    }
}