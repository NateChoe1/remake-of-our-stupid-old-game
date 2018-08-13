class Player {
  int points;
  Gun gun;
  Target target;
  int side;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  
  Player(int _side) {
    side = _side;
    gun = new Gun(side);
    target = new Target(side);
  }
  
  void draw() {
    gun.draw();
    target.draw();
    
  }
  
  boolean didHit(Target enemyTarget) {
    for (int i = bullets.size() - 1; i >= 0; i--) {     
      Bullet x = bullets.get(i);
      x.draw();
      if (x.didHit(enemyTarget.y)) {
        points++;
        return true;
      }
      if (x.outOfBounds()) {
        bullets.remove(i);
      }
    }
    return false;
  }
  
  void fire() {
    if (gun.hasAmmo()) {
      bullets.add(gun.trigger());
    }
  }
}
