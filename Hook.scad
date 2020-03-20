$fn=30;

hook();

module hook (length=50,height=7) {

    hookLength=15;
    slotWidth = length - hookLength - 15;

    difference() {
        cube([length, 15, height], center = true);

        translate([-slotWidth/2 + hookLength/2,0,0]) {
            hull() {
                translate([0, 0, 0]) {
                    cylinder(d = 5.2, h = height + 0.01, center = true);
                }

                translate([slotWidth, 0, 0]) {
                    cylinder(d = 5.2, h = height + 0.01, center = true);
                }
            }
        }

        translate([-length / 2 + 7.5, 0, 0]) {
            hull() {
                cylinder(d = 5.4, h = height+0.1, center = true);
                translate([0, 5, 0]) {
                    cube([5.4, 10, height+.1], center = true);
                }
            }
        }
    }
}