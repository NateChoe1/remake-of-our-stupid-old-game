class Gun extends MoveVert {
  PImage img;
  int side;
  boolean justShot;
  
  void init(int _side) {
    img = loadImage("sprites\\gunarm" + _side + ".png");
    side = _side;
  }
  
  void draw() {
    int[] xs = {83, 370};
    image(img, xs[side - 1], y - 794);
  }
}
