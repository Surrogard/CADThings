// Wooden Garden tool stand
// Designed by https://github.com/Surrogard

// Parameters
stand_height      = 150; // Height of the stand
stand_depth       = 50;  // Depth of the stand
stand_width       = 100; // Width of the stand
slot_width_wide   = 5;   //front width of the slot
slot_width_narrow = 2;   //back width of the slot
slot_depth        = 10;  // slot depth from the front of the board
board_depth       = 20;  //slot board depth
offset_depth      = 30;  // how far to the back should the stand be (for weight equalization)

// negativ of the tool slot shape for substraction later
module tool_slot() {
  linear_extrude(height = 10) polygon(points = [
    [0, 0],
    [slot_width_wide, 0],
    [slot_width_narrow, slot_depth],
    [0, slot_depth]
  ]);
}

// full stand including cut out triangle shapes for tool slots
module stand(){
  union() {
    //left side
    cube([3, stand_depth, 5]); //left foot
    translate([0, offset_depth - 20, 0]) rotate([45, 0, 0]) cube([3, 35, 5]); //left diagonal brace
    translate([0, offset_depth, 0]) {
      cube([3, 5, stand_height]); // left leg
    }
    // middle braces
    cube([stand_width, 3, 5]); // front foot brace
    translate([0, stand_depth, 0]) cube([stand_width, 3, 5]); //back foot brace
    // right side
    translate([stand_width - 3, 0, 0]) {
      cube([3, stand_depth, 5]); //right foot
      translate([0, offset_depth - 20, 0]) rotate([45, 0, 0]) cube([3, 35, 5]); //right diagonal brace
      translate([0, offset_depth, 0]) cube([3, 5, stand_height]); // right leg
    }
    // top side
    translate([0, offset_depth, stand_height]){
      cube([stand_width, 5, 3]); // top brace
      translate([0, -board_depth + 5, 3]) difference() { 
        cube([stand_width, board_depth, 3]); // tool slot board
        for(i=[0:6]){
          translate([i*14+5, 0, 0]) tool_slot(); // tool slot cutouts
        }
      }
    }
  }
}

stand();
