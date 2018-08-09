class MoveVert {
  int y;
  
  void moveUp() {
    if (y > 50) {
      y -= 5;
    }
  }
  
  void moveDown() {
    if (y < 330) {
      y += 5;
    }
  }
}
