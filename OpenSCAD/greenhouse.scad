module post(origin_offset=[0,0,0], direction=[1,0,0]){
  translate(origin_offset) cube(direction);
}

module frame(d=[400, 300, 200], braces=3, include_diagonal=false, include_siding=false){
  post([0, 0, 0], [d.x, 5, 3]);
  post([0, 0, 3], [3, 5, d.z-6]);
  post([d.x-3, 0, 3], [3, 5, d.z-6]);
  post([0, 0, d.z-3], [d.x, 5, 3]);
  brace_distance = d.x/(braces+1);
  for (i = [1:1:braces]) { 
    color ("green") post([(i*brace_distance)-1.5, 0, 3], [3, 5, d.z-6]);
  }
  if(include_diagonal){
    translate([0, 0, 50]) rotate([0,45,0]) cube([71, 5, 3]);
    translate([d.x-50, 0, 0]) rotate([0,-45,0]) cube([71, 5, 3]);
  }
  if(include_siding){
    color("white", 0.3) translate([0,-0.5,0]) cube([d.x, 0.5, d.z]);
  }
}

module roof(d=[400, 300, 200]){
  translate([0,0,d.z]) rotate([-48.5,0,0]) frame(, include_siding=false);
  translate(d) rotate([-48.5,0,180]) frame(, include_siding=false);
  color ("green") translate([0, d.y/2-1.5, 200]) cube([5, 3, 130]);
  color ("green") translate([d.x-5, d.y/2-1.5, 200]) cube([5, 3, 130]);
}

module beds(d=[400, 300, 20]){
  union(){
  translate ([5,5,0]) cube([d.x-10, d.y/3-5, d.z]);
  translate ([5, d.y/3*2,0]) cube([d.x-10, d.y/3-5, d.z]);
  translate ([5, d.y/3, 0]) cube([d.x/4,d.y/3,d.z]);
  }
}

dim=[400, 300, 200];

frame(dim, include_diagonal=true, include_siding=false);
translate([0, dim.y-5, 0]) frame(dim, include_diagonal=true, include_siding=false);
translate([5, 5, 0]) rotate([0,0,90]) frame([dim.y-10,dim.x,dim.z], 2, true, include_siding=false);
translate([dim.x, 5, 0]) rotate([0,0,90]) frame([dim.y-10,dim.x,dim.z], 2, true, include_siding=false);
roof();

color ("SaddleBrown") beds();