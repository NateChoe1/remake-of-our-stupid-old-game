class Target extends MoveVert {
  private int side;
  private PImage img;
  private int paddingLeft = 44;
  private int paddingRight = 45;
  private int targetHeight = 20;
  
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
