class Gun extends MoveVert {
  private PImage img;
  private int side;
  private int gunHeight = 22;
  private int PADDING = 83;
  int ammo = 0;
  
  Gun(int _side) {
    y = 60;
    img = loadImage("sprites/gunarm" + _side + ".png");
    side = _side;
  }
  
  Bullet trigger() {
    Bullet bullet = new Bullet(side);
    int[] xs = {116, 371};
    int[] boundaries = {370, 110};
    bullet.x = xs[side - 1];
    bullet.y = y;
    ammo--;
    if(side == 1) {
      bullet.direction = 260 / 20;
    } else {
      bullet.direction = -260 / 20;
    }
    bullet.destination = boundaries[side - 1];
    return bullet;
  }
  
  boolean hasAmmo() {return (ammo > 0);}
  
  void draw() {
    int[] xs = {PADDING, width - PADDING - img.width};
    image(img, xs[side - 1], y - img.height + gunHeight);
    if (frameCount % 60 == 0 && ammo < 10) {
      ammo++;
    }
  }
}
