class EndingBanner {
  int side;
  int timer = 0;
  PImage explosion, cryface;
  boolean showScore = false;
  
  void start(int _side) {
    side = _side;
    timer = 240;
    explosion = loadImage("sprites/explosion.jpg");
    cryface = loadImage("sprites/cryface" + side + ".png");
    
  }
  
  void draw() {
    if (timer < 180 && timer >= 120) {
      image(explosion, -330, -250);
    } else if (timer >= 60 && timer < 120) {
      image(cryface, 50, 0);
      showScore = true;
    }
    if (timer > 0) timer --;
  }
}
