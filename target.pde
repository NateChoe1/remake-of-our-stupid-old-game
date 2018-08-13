class Target extends MoveVert {
  int side;
  PImage img;
  int paddingLeft = 44;
  int paddingRight = 45;
  int targetHeight = 20;
  
  Target(int _side) {
    y = 330;
    side = _side;
    img = loadImage("sprites\\neck" + side + ".png");
  }
  
  void draw() {
    int[] xs = {paddingLeft, width - paddingRight - img.width};
    image(img, xs[side - 1], y - img.height + targetHeight);
  }
}
