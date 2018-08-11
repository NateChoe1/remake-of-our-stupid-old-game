// controls: QA for first gun, UJ for first target, TG for second gun, [; for second target, tab to shoot the first gun, R to shoot second gun
Gun gun1 = new Gun();
Gun gun2 = new Gun();
Target target1 = new Target();
Target target2 = new Target();
int startframe;
int stopframe;
int realstopframe;
int showscoreframe = 2160000;
int cryface;
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
  target1.init(1);
  target2.init(2); 
  arm1 = loadImage("sprites\\arm1.png");
  arm2 = loadImage("sprites\\arm2.png");
  gun1.init(1);
  gun2.init(2);
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
  gun1.draw();
  gun2.draw();
  target1.draw();
  target2.draw();
  text("controls: QA for first gun, ", 120, 150);
  text("UJ for first target, ", 120, 170);
  text("TG for second gun, ", 120, 190);
  text("[; for second target, ", 120, 210);
  text("tab to shoot the first gun, ", 120, 230);
  text("R to shoot second gun", 120, 250);
  boolean didHit = false;
  for (int i = player1Bullets.size() - 1; i >= 0; i--) {
    Bullet x = player1Bullets.get(i);
    x.draw();
    if (x.didHit(target2.y)) {
      player1points++;
      showHit(1);
      didHit = true;
      banner.start(1);
    }
    if (x.outOfBounds()) {
      player1Bullets.remove(i);
    }
  }
  
  for (int i = player2Bullets.size() - 1; i >= 0; i--) {
    Bullet x = player2Bullets.get(i);
    x.draw();
    if (x.didHit(target1.y)) {
      player2points++;
      showHit(2);
      didHit = true;
      banner.start(2);
    }
    if (x.outOfBounds()) {
      player1Bullets.remove(i);
    }
  }
  if (didHit) { 
    player1Bullets.clear();
    player2Bullets.clear();
  }
  
  if (frameCount % 60 == 0) {
    if (gun1.ammo < 10) {
      gun1.ammo++;
    }
    if (gun2.ammo < 10) {
      gun2.ammo++;
    }
  }
  
  text("Ammo: " + gun1.ammo, 50, 50);
  text("Ammo: " + gun2.ammo, 350, 50);
  
  banner.draw();
  
  if (banner.timer <= 0) {
    text("score: " + player1points, 50, 30);
    text("score: " + player2points, 350, 30);
  }
  textSize(10);
  text("Created by Nate and Glenn Choe", 0, 10);
}
void keyPressed() {
  char[] upControl = {'Q', 'T', 'U', '['};
  char[] downControl = {'A', 'G', 'J', ';'};  
  MoveVert[] objects = {gun1, gun2, target1, target2};
  
  for (int i = 0; i < 4; i++) {
    if (keyCode == upControl[i]) {
      objects[i].moveUp();
    }
    if (keyCode == downControl[i]) {
      objects[i].moveDown();
    }
  }
  
  
  if (keyCode == TAB && gun1.ammo > 0) {
    player1Bullets.add(gun1.trigger());
    gun1.ammo--;
  }
  if (keyCode == 'R' && gun2.ammo > 0) {
    player2Bullets.add(gun2.trigger());
    gun2.ammo--;
  }
}

void showHit(int side) {
  showscoreframe = frameCount + 240;
  realstopframe = frameCount + 180;
  stopframe = frameCount + 120;
  startframe = frameCount + 60;
  cryface = side;
}
