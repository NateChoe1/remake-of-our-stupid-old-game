class Target extends MoveVert {
  int side;
  PImage img;
  
  void init(int _side) {
    y = 330;
    side = _side;
    img = loadImage("sprites\\neck" + side + ".png");
  }
  
  void draw() {
    int[] xs = {44, 378};
    image(img, xs[side - 1], y - 792);
  }
}
