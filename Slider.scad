include <BOSL/constants.scad>;
use <BOSL/metric_screws.scad>;
$fn = 30;

module sliderBlock (length = 55, height = 10, thumbscrewHeight = 15, thumbscrewHeadDiameter=20, thumbscrewHeadHeight = 10) {
    difference() {
        cube([20, length, height], center = true);

        translate([0, -(length - 15) / 2, 0]) {
            screw(screwsize = 5.2, screwlen = 10, headsize = 8.8, headlen = 5.1, countersunk = false);
        }

        translate([0, -(length - 40) / 2, 0]) {
            screw(screwsize = 5.2, screwlen = 10, headsize = 8.8, headlen = 5.1, countersunk = false);
        }

        translate([0, length/2-10, thumbscrewHeight - height+0.01]) {
            screw(screwsize = 3.2, screwlen = thumbscrewHeight+0.02, headsize = thumbscrewHeadDiameter, headlen = thumbscrewHeadHeight, countersunk = false);
        }
    }
}