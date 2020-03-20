use<HingeBase.scad>;

$upperHinge_baseWidth = 10;
$upperHinge_baseHeight = 10;
$upperHinge_screwExtrusionHeight = 10;
$upperHinge_screwExtrusionPlunge = 5;
$upperHinge_hingeScrewInset = 0;
$upperHinge_hingeHeight = 7;
$upperHinge_screwDistanceToHinge = 5;
$upperHinge_offset = 1;

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