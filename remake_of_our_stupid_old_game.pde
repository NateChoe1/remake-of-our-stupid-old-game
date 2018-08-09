// controls: QA for first gun, UJ for first target, TG for second gun, [; for second target, tab to shoot the first gun, R to shoot second gun
Gun gun1 = new Gun();
Gun gun2 = new Gun();
Target target1 = new Target();
Target target2 = new Target();
Bullet bullet1 = new Bullet();
Bullet bullet2 = new Bullet();
int startframe;
int stopframe;
int realstopframe;
int showscoreframe = 2160000;
int cryface;
int player1points;
int player2points;
boolean justscored = false;
boolean bullet1moving = false;
int bullet2x = 360;
int bullet2y = 50;
boolean bullet2moving = false;
char[] keys = {'Q', 'A', 'T', 'G', 'U', 'J', '[', ';'};// char 39 is a single parenthesis
PImage background, longneck, cryface1, cryface2, explosion, arm1, arm2;

void setup() {
  size(500, 514);
  background = loadImage("sprites\\background.png");
  longneck = loadImage("sprites\\longneck.png");
  target1.init(1);
  target2.init(2);
  cryface1 = loadImage("sprites\\cryface1.png");
  cryface2 = loadImage("sprites\\cryface2.png");
  explosion = loadImage("sprites\\explosion.jpg");
  arm1 = loadImage("sprites\\arm1.png");
  arm2 = loadImage("sprites\\arm2.png");
  gun1.init(1);
  gun2.init(2);
  bullet1.init(1);
  bullet2.init(2);
}

void draw() {
  background(255);
  fill(0);
  textSize(20);
  text("controls: QA for first gun, ", 120, 150);
  text("UJ for first target, ", 120, 170);
  text("TG for second gun, ", 120, 190);
  text("[; for second target, ", 120, 210);
  text("tab to shoot the first gun, ", 120, 230);
  text("R to shoot second gun", 120, 250);
  rectMode(CORNER);
  imageMode(CORNER);
  image(background, 0, 400);
  image(longneck, 44, 0);
  image(longneck, 435, 0);
  image(arm1, 70, -66);
  image(arm2, 405, -66);
  gun1.draw();
  gun2.draw();
  
  target1.draw();
  target2.draw();
  if (bullet1moving) {
    if (gun1.justShot) {
      shootbullet(bullet1, gun1.y, bullet1x, true);
      bullet1y = gun1.y;
      gun1.justShot = false;
    }
    else {
      shootbullet(bullet1, bullet1y, bullet1x, true);
    }
  }
  if (bullet2moving) {
    if (gun2.justShot) {
      shootbullet(bullet2, gun2.y, bullet2x, false);
      bullet2y = gun2.y;
      gun2.justShot = false;
    }
    else {
      shootbullet(bullet2, bullet2y, bullet2x, false);
    }
  }
  if (bullet1x > 368 && bullet1y >= target2.y && bullet1y <= target2.y + 10) {
    player1points++;
    showscoreframe = frameCount + 240;
    realstopframe = frameCount + 180;
    stopframe = frameCount + 120;
    startframe = frameCount + 60;
    bullet1moving = false;
    bullet1y = 0;
    cryface = 1;
  }
  if (bullet2x < 100 && bullet2y >= target1.y && bullet2y <= target1.y + 10) {
    player2points++;
    showscoreframe = frameCount + 240;
    realstopframe = frameCount + 180;
    stopframe = frameCount + 120;
    startframe = frameCount + 60;
    bullet2moving = false;
    bullet2y = 0;
    cryface = 2;
  }
  if (frameCount >= showscoreframe) {
    text("score: " + player1points, 50, 20);
    text("score: " + player2points, 350, 20);
  }
  if (cryface == 1 && frameCount <= stopframe && frameCount >= startframe) {
    image(cryface1, 50, 0);
    justscored = true;
  }
  else if (cryface == 2 && frameCount <= stopframe && frameCount >= startframe) {
    image(cryface2, 50, 0);
  }
  else if (frameCount > stopframe && frameCount < realstopframe) {
    image(explosion, -330, -250);
  }
  else {
    justscored = false;
  }
  textSize(10);
  text("Created by Nate and Glenn Choe", 0, 10);
}

void shootbullet(PImage bullet, int guny, int bulletx, boolean shotgun1) {
  image(bullet, bulletx, guny + 2);
  if (shotgun1) {
    if (frameCount % 5 == 0) {
      bullet1x += 260 / 15;
      if (bullet1x > 500) {
        bullet1moving = false;
        bullet1x = 140;
        gun1.justShot = true;
        bullet1y = 0;
      }
    }
  }
  else {
    if (frameCount % 5 == 0) {
      bullet2x -= 260 / 15;
      if (bullet2x < 0) {
        bullet2moving = false;
        bullet2x = 360;
        gun2.justShot = true;
        bullet2y = 0;
      }
    }
  }
}

void keyPressed() {
  if (justscored == false) {
    
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
    
    if (keyCode == 'R') {
      bullet2moving = true;
    }
    if (keyCode == TAB) {
      bullet1moving = true;
    }
  }
}