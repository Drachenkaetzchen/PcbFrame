include<NopSCADlib/vitamins/extrusions.scad>;
include<NopSCADlib/vitamins/extrusion_bracket.scad>;
include<NopSCADlib/vitamins/extrusion_brackets.scad>;

use<HingeBase.scad>;
use<Slider.scad>;
use<PcbRail.scad>;
use<Hook.scad>;
use<HookBlock.scad>;

$longSideExtrusionLength = 350;
$shortSideExtrusionLength = 220;
$slidingRailExtrusionLength = 295;

$lowerHinge_baseWidth = 20;
$lowerHinge_baseHeight = 10;
$lowerHinge_screwExtrusionHeight = 10;
$lowerHinge_screwExtrusionPlunge = 5;
$lowerHinge_hingeScrewInset = 5;
$lowerHinge_hingeHeight = 10;
$lowerHinge_screwDistanceToHinge = 5;

$upperHinge_baseWidth = 10;
$upperHinge_baseHeight = 10;
$upperHinge_screwExtrusionHeight = 10;
$upperHinge_screwExtrusionPlunge = 5;
$upperHinge_hingeScrewInset = 0;
$upperHinge_hingeHeight = 7;
$upperHinge_screwDistanceToHinge = 5;
$upperHinge_offset = 1;

$slider1_offset = 30;
$slider2_offset = - 30;

$sliderBlock_length = 55;

$pcbRail_height = 10;
$pcbRail_clearance = 10;

$backPlateLength = 212;
$backPlateWidth = 311;
$backPlateHeight = 3;

$foamLength = 180;
$foamWidth = 280;
$foamHeight = 10;

$hingeBlockHeight = ($foamHeight + $backPlateHeight) + $upperHinge_hingeHeight / 2 + $lowerHinge_hingeHeight / 2;

echo("Hook block height is",$hingeBlockHeight);

baseFrame();
lowerHinges();
upperHinges();
sliders();
backPlate();
hingeBlocks();


module hingeBlocks () {
    translate([$shortSideExtrusionLength / 2-30, - $longSideExtrusionLength / 2 + 10, 10 + $hingeBlockHeight / 2])
        {
            hookBlock($hingeBlockHeight);
        }

    translate([$shortSideExtrusionLength / 2-30,  $longSideExtrusionLength / 2 - 10, 10 + $hingeBlockHeight / 2])
        {
            hookBlock($hingeBlockHeight);
        }
}



translate([$backPlateLength/2-10,-$backPlateWidth/2+7.5,$backPlateHeight+$upperHinge_hingeHeight/2+$lowerHinge_hingeHeight/2+20+7/2]) {
    rotate([0,0,90]) {
        hook();
    }
}


translate([$backPlateLength/2-10,$backPlateWidth/2-7.5,$backPlateHeight+$upperHinge_hingeHeight/2+$lowerHinge_hingeHeight/2+20+7/2]) {
    rotate([180,0,270]) {
        hook();
    }
}


module backPlate() {

    translate([0, 0, 10 + ($backPlateHeight / 2 + $foamHeight)+$upperHinge_hingeHeight/2+$lowerHinge_hingeHeight/2]) {
        color("silver") {
            cube([$backPlateLength, $backPlateWidth, $backPlateHeight], center = true);
        }

        translate([0, 0, - ($backPlateHeight / 2 + $foamHeight / 2)]) {

            color("DarkSlateGray") {
                cube([$foamLength, $foamWidth, $foamHeight], center = true);

            }
        }
    }
}

module sliders() {

    translate([$slider1_offset, 0, 0]) {

        translate([0, $longSideExtrusionLength / 2 - $sliderBlock_length / 2, 15]) {
            sliderBlock($sliderBlock_length);
        }
        translate([0, - ($longSideExtrusionLength / 2 - $sliderBlock_length / 2), 15]) {
            rotate([0, 0, 180]) {
                sliderBlock($sliderBlock_length);
            }
        }
        rotate([90, 0, 0]) {
            extrusion(E2020, $slidingRailExtrusionLength, true);
        }

        translate([0, 0, 10 + $pcbRail_height / 2]) {
            rotate([0, 0, 180]) {
                pcbRail(length = $slidingRailExtrusionLength - $sliderBlock_length - $pcbRail_clearance, height =
                $pcbRail_height);
            }
        }
    }

    translate([$slider2_offset, 0, 0]) {
        translate([0, $longSideExtrusionLength / 2 - $sliderBlock_length / 2, 15]) {
            sliderBlock($sliderBlock_length);
        }
        translate([0, - ($longSideExtrusionLength / 2 - $sliderBlock_length / 2), 15]) {
            rotate([0, 0, 180]) {
                sliderBlock($sliderBlock_length);
            }
        }
        rotate([90, 0, 0]) {
            extrusion(E2020, $slidingRailExtrusionLength, true);
        }

        translate([0, 0, 10 + $pcbRail_height / 2]) {
            pcbRail(length = $slidingRailExtrusionLength - $sliderBlock_length - $pcbRail_clearance, height =
            $pcbRail_height);
        }
    }
}

module lowerHinges() {
    translate([- $shortSideExtrusionLength / 2 + $lowerHinge_screwDistanceToHinge, - $longSideExtrusionLength / 2 + 10,
    10 + $lowerHinge_baseHeight / 2]) {
        rotate([0, 0, 90]) {
            createHinge(
            baseWidth = $lowerHinge_baseWidth,
            baseHeight = $lowerHinge_baseHeight,
            screwExtrusionHeight = $lowerHinge_screwExtrusionHeight,
            screwExtrusionPlunge = $lowerHinge_screwExtrusionPlunge,
            hingeScrewInset = $lowerHinge_hingeScrewInset,
            hingeHeight = $lowerHinge_hingeHeight,
            screwDistanceToHinge = $lowerHinge_screwDistanceToHinge
            );
        }
    }

    translate([- $shortSideExtrusionLength / 2 + $lowerHinge_screwDistanceToHinge, $longSideExtrusionLength / 2 - 10, 10
    + $lowerHinge_baseHeight / 2]) {
        mirror([0, 1, 0]) {
            rotate([0, 0, 90]) {
                createHinge(
                baseWidth = $lowerHinge_baseWidth,
                baseHeight = $lowerHinge_baseHeight,
                screwExtrusionHeight = $lowerHinge_screwExtrusionHeight,
                screwExtrusionPlunge = $lowerHinge_screwExtrusionPlunge,
                hingeScrewInset = $lowerHinge_hingeScrewInset,
                hingeHeight = $lowerHinge_hingeHeight,
                screwDistanceToHinge = $lowerHinge_screwDistanceToHinge
                );
            }
        }
    }
}

module upperHinges() {
    translate([- $shortSideExtrusionLength / 2 + $upperHinge_screwDistanceToHinge, - $longSideExtrusionLength / 2 +  (20+$upperHinge_offset+$upperHinge_baseWidth/2),
    20 +  $upperHinge_hingeHeight/2 + $lowerHinge_hingeHeight/2-5]) {
        rotate([0, 180, 90]) {
            createHinge(
            baseWidth = $upperHinge_baseWidth,
            baseHeight = $upperHinge_baseHeight,
            screwExtrusionHeight = $upperHinge_screwExtrusionHeight,
            screwExtrusionPlunge = $upperHinge_screwExtrusionPlunge,
            hingeScrewInset = $upperHinge_hingeScrewInset,
            hingeHeight = $upperHinge_hingeHeight,
            screwDistanceToHinge = $upperHinge_screwDistanceToHinge,
            roundedHinge=true
            );
        }
    }

    translate([- $shortSideExtrusionLength / 2 + $upperHinge_screwDistanceToHinge, $longSideExtrusionLength / 2 - (20+$upperHinge_offset+$upperHinge_baseWidth/2) , 20 +  $upperHinge_hingeHeight/2 + $lowerHinge_hingeHeight/2-5]) {
        mirror([0, 1, 0]) {
            rotate([0, 180, 90]) {
                createHinge(
                baseWidth = $upperHinge_baseWidth,
                baseHeight = $upperHinge_baseHeight,
                screwExtrusionHeight = $upperHinge_screwExtrusionHeight,
                screwExtrusionPlunge = $upperHinge_screwExtrusionPlunge,
                hingeScrewInset = $upperHinge_hingeScrewInset,
                hingeHeight = $upperHinge_hingeHeight,
                screwDistanceToHinge = $upperHinge_screwDistanceToHinge,
                roundedHinge=true
                );
            }
        }
    }
}
module baseFrame() {
    translate([$shortSideExtrusionLength / 2 + 10, 0, 0]) {
        rotate([90, 0, 0]) {
            extrusion(E2020, $longSideExtrusionLength, true);
        }
    }

    translate([- $shortSideExtrusionLength / 2 - 10, 0, 0]) {
        rotate([90, 0, 0]) {
            extrusion(E2020, $longSideExtrusionLength, true);
        }
    }

    translate([0, $longSideExtrusionLength / 2 - 10, 0]) {
        rotate([0, 90, 0]) {
            extrusion(E2020, $shortSideExtrusionLength, true);
        }
    }

    translate([0, - $longSideExtrusionLength / 2 + 10, 0]) {
        rotate([0, 90, 0]) {
            extrusion(E2020, $shortSideExtrusionLength, true);
        }
    }

    translate([- $shortSideExtrusionLength / 2, - $longSideExtrusionLength / 2 + 20, 0]) {
        extrusion_corner_bracket(E20_corner_bracket);
    }

    translate([$shortSideExtrusionLength / 2, - $longSideExtrusionLength / 2 + 20, 0]) {
        rotate([0, 0, 90])
            extrusion_corner_bracket(E20_corner_bracket);
    }

    translate([$shortSideExtrusionLength / 2, $longSideExtrusionLength / 2 - 20, 0]) {
        rotate([0, 0, 180])
            extrusion_corner_bracket(E20_corner_bracket);
    }

    translate([- $shortSideExtrusionLength / 2, $longSideExtrusionLength / 2 - 20, 0]) {
        rotate([0, 0, 270])
            extrusion_corner_bracket(E20_corner_bracket);
    }
}