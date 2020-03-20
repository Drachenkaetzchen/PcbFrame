$fn=30;

hookBlock(21.5);

module hookBlock (hookBlockHeight) {



    difference() {
        cube([20, 15, hookBlockHeight], center = true);
        cylinder(d = 5.2, h = hookBlockHeight + 0.1, center = true);
        translate([0, 0, - 1.51]) {
            cube([8.2, 8.2, hookBlockHeight - 3], center = true);
        }
    }

    translate([16, 0, - hookBlockHeight / 2 + 5]) {
        difference() {
            cube([12, 15, 10], center = true);
            cylinder(d = 5.2, h = 10.01, center = true);
            translate([0, 0, 2.5]) {
                cylinder(d = 9, h = 5.01, center = true);
            }
        }
    }

    translate([- 16, 0, - hookBlockHeight / 2 + 5]) {
        difference() {
            cube([12, 15, 10], center = true);
            cylinder(d = 5.2, h = 10.01, center = true);
            translate([0, 0, 2.5]) {
                cylinder(d = 9, h = 5.01, center = true);
            }
        }
    }
}