class Bullet {
  int x;
  int y;
  int direction;
  PImage img;
  int side;
  boolean justHit;
  
  void init(int _side) {
    side = _side;
    img = loadImage("sprites\\bullet" + side + ".png");
  }
  
  void trigger(Gun gun) {
    int[] xs = {130, 360};
    x = xs[side - 1];
    y = gun.y;
    if(gun.side == 1) {
      direction = 260 / 15;
    } else {
      direction = -260 / 15;
    }
  }
  
  boolean didHit(int targetY) {
    image(img, x, y);
    x += direction;
    boolean[] outOfBoundaries = {x > 370, x < 120};
    if (outOfBoundaries[side - 1]) {
      if (y >= targetY && y <= targetY + 10) {
        return true;
      }
    }
    return false;
  }
}
