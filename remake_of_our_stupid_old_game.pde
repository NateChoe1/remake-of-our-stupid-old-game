// controls: QA for first gun, UJ for first target, TG for second gun, [; for second target, tab to shoot the first gun, R to shoot second gun
Player player1;
Player player2;
int player1points;
int player2points;
EndingBanner banner = new EndingBanner();
ArrayList<Bullet> player1Bullets = new ArrayList<Bullet>();
ArrayList<Bullet> player2Bullets = new ArrayList<Bullet>();
char[] keys = {'Q', 'A', 'T', 'G', 'U', 'J', '[', ';'};
PImage background, longneck, arm1, arm2;

void setup() {
  size(500, 514);
  background = loadImage("sprites\\background.png");
  longneck = loadImage("sprites\\longneck.png");
  player1 = new Player(1);
  player2 = new Player(2);
  arm1 = loadImage("sprites\\arm1.png");
  arm2 = loadImage("sprites\\arm2.png");
  rectMode(CORNER);
  imageMode(CORNER);
}

void draw() {
  background(255);
  fill(0);
  textSize(20);
  image(background, 0, 400);
  image(longneck, 44, 0);
  image(longneck, 435, 0);
  image(arm1, 70, -66);
  image(arm2, 405, -66);
  player1.draw();
  player2.draw();
  text("controls: QA for first gun, ", 120, 150);
  text("UJ for first target, ", 120, 170);
  text("TG for second gun, ", 120, 190);
  text("[; for second target, ", 120, 210);
  text("tab to shoot the first gun, ", 120, 230);
  text("R to shoot second gun", 120, 250);
  boolean didHit = false;
  
  if (banner.showScore) {
    text("score: " + player1points, 50, 30);
    text("score: " + player2points, 350, 30);
  }
  
  for (int i = player1Bullets.size() - 1; i >= 0; i--) {
    Bullet x = player1Bullets.get(i);
    x.draw();
    if (x.didHit(player2.target.y)) {
      player1points++;
      didHit = true;
      banner.start(1);
    }
    if (x.outOfBounds()) {
      player1Bullets.remove(i);
    }
  }
  
  for (int i = player2Bullets.size() - 1; i >= 0; i--) {//todo: there is a duplication     
    Bullet x = player2Bullets.get(i);
    x.draw();
    if (x.didHit(player1.target.y)) {
      player2points++;
      didHit = true;
      banner.start(2);
    }
    if (x.outOfBounds()) {
      player2Bullets.remove(i);
    }
  }
  if (didHit) { 
    player1Bullets.clear();
    player2Bullets.clear();
  }
  
  if (frameCount % 60 == 0) {
    if (player1.gun.ammo < 10) {
      player1.gun.ammo++;
    }
    if (player2.gun.ammo < 10) {
      player2.gun.ammo++;
    }
  }
  
  text("Ammo: " + player1.gun.ammo, 50, 50);
  text("Ammo: " + player2.gun.ammo, 350, 50);
  
  banner.draw();
  textSize(10);
  text("Created by Nate and Glenn Choe", 0, 10);
}
void keyPressed() {
  char[] upControl = {'Q', 'T', 'U', '['};
  char[] downControl = {'A', 'G', 'J', ';'};  
  MoveVert[] objects = {player1.gun, player2.gun, player1.target, player2.target};
  
  for (int i = 0; i < 4; i++) {
    if (keyCode == upControl[i]) {
      objects[i].moveUp();
    }
    if (keyCode == downControl[i]) {
      objects[i].moveDown();
    }
  }
  
  
  if (keyCode == TAB && player1.gun.ammo > 0) {
    player1Bullets.add(player1.gun.trigger());
    player1.gun.ammo--;
  }
  if (keyCode == 'R' && player2.gun.ammo > 0) {
    player2Bullets.add(player2.gun.trigger());
    player2.gun.ammo--;
  }
}
