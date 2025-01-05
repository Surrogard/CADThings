// Maße: 32,2 x 24,5 x 20,4
// Innen: 24,2
// Pinöpel: 5,4 x 15,5 / 2,3mm Versatz
// Fuss: Durchmesser: 23mm / Höhe: 2mm
$fn=128;

difference(){
  scale([1, 1, 0.745]) sphere(d=32.2);
  translate([0,0,4.5]) rotate([90, 0,0]) cylinder(h=80,d=24.2, center=true);
  translate([0, 0, -14]) cylinder(h=4, d=23);
}

translate([0, 0, -8]) cylinder(h=8, d=5.4);
cylinder(h=8, d1=6, d2=4.5);

translate([0, 0, -11]) cylinder(h=3, d=23);