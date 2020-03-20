include <BOSL/constants.scad>;
use <BOSL/metric_screws.scad>;

$fn = 30;

createHinge(
baseWidth = 20,
baseHeight = 10,
screwExtrusionHeight = 10,
screwExtrusionPlunge = 5,
hingeScrewInset = 5,
hingeHeight = 10
);

module createHinge(
baseWidth = 20, // Width of the block (2020 extrusion width)
baseHeight = 10, // Height of the block
screwExtrusionHeight = 8, // Screw height for mounting to the extrusions.
screwExtrusionPlunge = 5, // How deep the screw should go into the extrusion.
hingeScrewInset = 5, // How much the screw should be inset. 5 means flush to the edge (M5 hex screw head = 5mm)
hingeHeight = 15, // How high the hinge should be mounted.
screwDistanceToHinge = 5,
roundedHinge = false

) {
    difference() {
        base(baseWidth, baseHeight, hingeHeight, screwDistanceToHinge, roundedHinge);

        translate([- (baseWidth / 2) + hingeScrewInset, 10 + screwDistanceToHinge, hingeHeight / 2]) {
            rotate([0, 270, 0]) {
                screw(screwsize = 5.2, screwlen = baseWidth, headsize = 8.8, headlen = 5.01, countersunk = false);
            }
        }
        translate([0, - 20, - (baseHeight / 2) + (screwExtrusionHeight - screwExtrusionPlunge)]) {
            screw(screwsize = 5.2, screwlen = screwExtrusionHeight, headsize = 8.8, headlen = baseHeight, countersunk
            =
            false)
            ;
        }

        translate([0, - 5, - (baseHeight / 2) + (screwExtrusionHeight - screwExtrusionPlunge)]) {
            screw(screwsize = 5.2, screwlen = screwExtrusionHeight, headsize = 8.8, headlen = baseHeight)
            ;
        }


    }
}

module base(baseWidth, baseHeight, hingeHeight, screwDistanceToHinge, rounded = true) {

    translate([0, - (15 - screwDistanceToHinge / 2), 0]) {
        cube([baseWidth, 30 + screwDistanceToHinge, baseHeight], center = true);
    }

    hull() {
        translate([0, 10 + screwDistanceToHinge, 0]) {
            translate([0, 0, hingeHeight / 2]) {

                rotate([0, 90, 0]) {
                    cylinder(d = 20, h = baseWidth, center = true);
                }
            }


            if (rounded) {
                translate([0, - 5, 0]) {

                    cube([baseWidth, 10, baseHeight], center = true);
                }
            } else {

                cube([baseWidth, 20, baseHeight], center = true);
            }
        }


    }
}