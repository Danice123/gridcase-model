// Units in mm

width = 285;
depth = 190;

keyboardHeight = 25;

wallWidth = 2;
hingeWall = 20;

cube([width, depth, wallWidth], true);

translate([width / 2 - wallWidth, -depth / 2, 0]) {
    cube([wallWidth, depth, keyboardHeight], false);
}

translate([-width / 2, -depth / 2, 0]) {
    cube([wallWidth, depth, keyboardHeight], false);
}
    
translate([-width / 2, depth / 2 - hingeWall, 0]) {
    cube([width, hingeWall, keyboardHeight], false);
}

translate([-width / 2, -depth / 2, 0]) {
    cube([width, wallWidth, keyboardHeight], false);
}
