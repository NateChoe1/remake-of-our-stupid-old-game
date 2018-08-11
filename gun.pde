class Gun extends MoveVert {
  PImage img;
  int side;
  boolean justShot;
  int gunHeight = 22;
  int PADDING = 83;
  
  void init(int _side) {
    justShot = true;
    y = 60;
    img = loadImage("sprites\\gunarm" + _side + ".png");
    side = _side;
  }
  
  void draw() {
    int[] xs = {PADDING, width - PADDING - img.width};
    image(img, xs[side - 1], y - img.height + gunHeight);
  }
}
