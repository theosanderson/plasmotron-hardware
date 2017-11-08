widthinside=120;
lengthbottom=300;
semiheight=900;
fullheight=1000;
beamwidth=15;
partdistance=165;
microplatex=165;
microplatex2=30;
microplatey=24;
microplatez=500;

module linearBearing(){
    
}

module motorAndShaft(){
    cube([43.2,43.2,17],center=true);
    cylinder(1000,4,4);
}


module microplate(){
    width=86.5;
    length=127.8;
    height=20;
    cube([length,width,height]);
}
module beam(length,dir="z"){
    if(dir=="z")
translate([7.5,7.5,0])linear_extrude(height=length)import("openbeam.dxf");
      if(dir=="x")
translate([0,7.5,7.5])rotate([0,90,0])linear_extrude(height=length)import("openbeam.dxf");
      if(dir=="y")
translate([7.5,0,7.5])rotate([-90,0,0])linear_extrude(height=length)
import("openbeam.dxf");
}


beam(lengthbottom,"x");

translate([0,0,beamwidth])beam(fullheight,"z");

translate([0,widthinside,beamwidth])beam(fullheight,"z");
translate([beamwidth+partdistance,0,beamwidth])beam(fullheight,"z");

translate([beamwidth+partdistance,widthinside,beamwidth])beam(fullheight,"z");

translate([lengthbottom-beamwidth,0,beamwidth])beam(semiheight,"z");
translate([lengthbottom-beamwidth,widthinside,beamwidth])beam(semiheight,"z");
translate([0,widthinside,0])beam(lengthbottom,"x");
translate([0,beamwidth,0])beam(widthinside,"y");
translate([lengthbottom-beamwidth,beamwidth,0])beam(widthinside,"y");
translate([microplatex,microplatey,microplatez])color("red") microplate();
translate([microplatex2,microplatey,microplatez])color("green") microplate();

translate([43/2,50+43/2,beamwidth+10])color("blue") motorAndShaft();