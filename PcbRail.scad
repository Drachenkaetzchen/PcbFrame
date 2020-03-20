include <BOSL/constants.scad>;
use <BOSL/metric_screws.scad>;

pcbRail();


module pcbRail (length=200,height=10,pcbThickness=1.6,pcbTolerance=0.2,slotDistance=1,slotInset=1.5) {
    width=15;
    
    slotD = slotDistance + pcbThickness + pcbTolerance;
    
    numRails = floor(height / slotD) - 1;

    difference() {
    cube([width,length,height],center=true);
    
    
    
    for (i=[0:numRails]) {
    translate([width/2-slotInset/2+0.1,0,-height/2+slotDistance + (pcbThickness+pcbTolerance)/2 +i*slotD])
    cube([slotInset,length+0.1,pcbThickness + pcbTolerance],center=true);
    }

    translate([0, -(length - 40) / 2, 0]) {
        screw(screwsize = 5.2, screwlen = 10, headsize = 8.8, headlen = 5.1 + (height-5), countersunk = false);
    }
    
    translate([0, (length - 40) / 2, 0]) {
        screw(screwsize = 5.2, screwlen = 10, headsize = 8.8, headlen = 5.1+ (height-5), countersunk = false);
    }
}
}