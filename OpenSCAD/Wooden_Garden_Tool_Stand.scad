// Wooden Garden tool stand
// Designed by https://github.com/Surrogard

// Parameters
stand_height = 150; // Height of the stand
stand_depth = 50; // Depth of the stand
stand_width = 100; // Width of the stand
slot_width_wide = 5; //front width of the slot
slot_width_narrow = 2; //back width of the slot
slot_depth = 10; // slot depth from the front of the board
board_depth = 20; //slot board depth
offset_depth = 30; // how far to the back should the stand be (for weight equalization)

// negativ of the tool slot shape for substraction later
module tool_slot() {
  union() {
    cube([slot_width_narrow, slot_depth, 10]);
    translate([slot_width_narrow, 0, 0])
        triangle(
          triangle_width=slot_width_wide-slot_width_narrow, 
          triangle_depth=slot_depth, 
          triangle_height=10);
  }
}

// 3d triangle shape with wide side on the front and left side parallel to the y axis
module triangle(triangle_width, triangle_depth, triangle_height){
  linear_extrude(height=triangle_height)
      polygon(points = [
        [0, 0],
        [triangle_width, 0],
        [0, triangle_depth]
      ]);
}

// full stand including cut out triangle shapes for tool slots
module stand(){
  union() {
    cube([3,stand_depth,5]); //left foot
    translate([0,offset_depth,0]) {
      cube([3,5,stand_height]); // left leg
      cube([stand_width,5,3]); // foot brace
    }
    translate([stand_width-3,0,0]) {
      cube([3,stand_depth,5]); //right foot
      translate([0,offset_depth,0]) cube([3,5,stand_height]); // right leg
    }
    translate([0,offset_depth,stand_height ]){
      cube([stand_width,5, 3]); // top brace
      translate([0, -board_depth + 5, 3]) 
        difference() { 
          cube([stand_width, board_depth, 3]); // tool slot board
          for(i=[0:4]){
            translate([i*20+7.5,0,0]) tool_slot(); // tool slot cutouts
          }
      }
    }
  }
}

stand();
