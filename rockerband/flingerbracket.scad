use <screwbracket.scad>;

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

        translate([0, 49.5, plateHeight / 2]) cube([9, 2, plateHeight / 2], false);
        translate([40, 12, 0]) cube([6.5, 2, plateHeight], false);
        
        translate([3.25, 22, 0]) cylinder(r=2.625, h=10, center=true);
        translate([45, 41, 0]) cylinder(r=2.625, h=10, center=true);

        translate([plateWidth - 7, 12, 0]) cube([2, 13, 10], false);
        translate([9, plateLength - 1.5 - 26.5, 0]) cube([2, 26.5, 10], false);
    }
}

module brace(holeSize) {
    difference() {
        union() {
            cube([30, 1.75, 11.5], false);
            translate([2, 0, 0]) cube([1, 5, 11.5], false);
            translate([-2, 0, 0]) cube([8, 5, 3], false);
            translate([27, 0, 0]) cube([1, 5, 11.5], false);
            translate([24, 0, 0]) cube([8, 5, 3], false);

            translate([4, -4, 8.5]) raisedScrewHole(3);
            translate([26, -4, 8.5]) raisedScrewHole(3);

            translate([8, -4, 8.5]) cube([14, 4, 3], false);
        }

        translate([14.5, 0, 2.5]) rotate([90, 90, 0]) cylinder(r=holeSize, h=4, center=true);
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

module switchFitting() {
    difference() {
        cube([12, 3, 13], false);
        translate([5, 2, 0]) cube([1, 1, 14], false);
    }
}

module switchSocket() {
    switchFitting();
    translate([0, 20.5, 0]) mirror([0, 1, 0]) switchFitting();
}

translate([0, 0, 13]) {
    plate();
    translate([3.25, 22, -2.70]) screwOffset();
    translate([45, 41, -2.70]) screwOffset();
}


translate([9, 0, 13]) mirror([0, 0, 1]) union() {
    brace(2);
    
}
translate([9, 63.5,  13]) mirror([0, 1, 0]) mirror([0, 0, 1]) brace(2.5);

translate([-5, 35, 1.5]) switchSocket();

translate([51, 7, 1.5]) mirror([1, 0, 0]) switchSocket();