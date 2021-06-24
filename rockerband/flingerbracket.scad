
module plate() {
    plateLength = 63.5;
    plateWidth = 46.5;
    plateHeight = 1.5;

    difference() {
        union() {
            translate([13, 0, 0])   color("white") cube([22, plateLength, plateHeight + 1], false);
            union() {
                translate([9, 0, 0])    color("grey") cube([30.25, plateLength, plateHeight + 0.75], false);
                translate([5, 6, 0])    color("grey") cube([4, 19, plateHeight + 0.75], false);
                translate([39, 39, 0])  color("grey") cube([4, 18.25, plateHeight + 0.75], false);
            }
            cube([plateWidth, plateLength, plateHeight], false);
        }
        translate([15, 1.75, 0]) cube([18, plateLength - 3.5, 4], false);

        translate([0, 49.5, 0]) cube([4.5, 2, plateHeight], false);
        translate([40, 12, 0]) cube([6.5, 2, plateHeight], false);
        
        translate([3.25, 22, 0]) cylinder(r=2.625, h=10, center=true);
        translate([45, 41, 0]) cylinder(r=2.625, h=10, center=true);
    }
}

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

module brace() {
    difference() {
        union() {
            cube([30, 1.75, 11.5], false);
            translate([2, 0, 0]) cube([1, 5, 11.5], false);
            translate([27, 0, 0]) cube([1, 5, 11.5], false);

            translate([4, -4, 8.5]) raisedScrewHole(3);
            translate([26, -4, 8.5]) raisedScrewHole(3);

            translate([8, -4, 8.5]) cube([14, 4, 3], false);
        }

        translate([14.5, 0, 2.5]) rotate([90, 90, 0]) cylinder(r=2.5, h=4, center=true);
    }

}

module screwOffset() {
    union() {
        difference() {
            cylinder(r=3.5, h=8.4, center=true);
            cylinder(r=2.5, h=8.4, center=true);
        }
        translate([0, 0, -4.2]) difference() {
            cylinder(r=3.5, h=1, center=true);
            cylinder(r=1.75, h=1, center=true);
        }
        
    }
}

translate([0, 0, 13]) {
    plate();
    translate([3.25, 22, -2.70]) screwOffset();
    translate([45, 41, -2.70]) screwOffset();
}


translate([9, 0, 13]) mirror([0, 0, 1]) union() {
    brace();
    
}
translate([9, 63.5,  13]) mirror([0, 1, 0]) mirror([0, 0, 1]) brace();


