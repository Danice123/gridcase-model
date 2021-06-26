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