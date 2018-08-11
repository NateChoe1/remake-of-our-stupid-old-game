class MoveVert {
  int y;
  int WALL_TOP = 60;
  int WALL_BOTTOM = 330;
  
  void moveUp() {
    if (y > WALL_TOP) {
      y -= 5;
    }
  }
  
  void moveDown() {
    if (y < WALL_BOTTOM) {
      y += 5;
    }
  }
}
