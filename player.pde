class Player {
  int points;
  Gun gun;
  Target target;
  int side;
  
  Player(int _side) {
    side = _side;
    gun = new Gun(side);
    target = new Target(side);
  }
  
  void draw() {
    gun.draw();
    target.draw();
  }
}
