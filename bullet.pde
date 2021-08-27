class Bullet {
  int x;
  int y;
  int direction;
  PImage img;
  int side;
  boolean moving;
  int destination;
  
  Bullet (int _side) {
    side = _side;
    img = loadImage("sprites/bullet" + side + ".png");
  }
  
  boolean outOfBounds() {
    return (x < 0 || x > 500);
  }
  
  boolean didHit(int targetY) {
    if (x > destination && x < destination + 10) {
      if (y >= targetY && y <= targetY + 10) {
        return true;
      }
    }
    return false;
  }
  
  void draw() {
    x += direction;
    image(img, x, y);
  }
}
