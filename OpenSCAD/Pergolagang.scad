module gitter(){
  cube([]);
}

module seitenwand(){
  // Rahmen
  cube([5,3,200]);
  translate([45,0,0]) cube([5,3,200]);
  translate([5,0,0]) cube([40,3,5]);
  translate([5,0,195]) cube([40,3,5]);
  // Gitter
  
}


seitenwand();
translate([0, 197, 0]) seitenwand();