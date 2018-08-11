class Gun extends MoveVert {
  PImage img;
  int side;
  int gunHeight = 22;
  int PADDING = 83;
  int ammo = 0;
  
  void init(int _side) {
    y = 60;
    img = loadImage("sprites\\gunarm" + _side + ".png");
    side = _side;
  }
  
  Bullet trigger() {
    Bullet bullet = new Bullet(side);
    int[] xs = {116, 371};
    int[] boundaries = {370, 110};
    bullet.x = xs[side - 1];
    bullet.y = y;
    if(side == 1) {
      bullet.direction = 260 / 20;
    } else {
      bullet.direction = -260 / 20;
    }
    bullet.destination = boundaries[side - 1];
    return bullet;
  }
  
  void draw() {
    int[] xs = {PADDING, width - PADDING - img.width};
    image(img, xs[side - 1], y - img.height + gunHeight);
  }
}
