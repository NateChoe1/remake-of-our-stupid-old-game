// controls: QA for first gun, UJ for first target, TG for second gun, [; for second target, tab to shoot the first gun, R to shoot second gun
Player player1;
Player player2;
EndingBanner banner;
Background background;

void setup() {
  size(500, 514);
  background = new Background();
  player1 = new Player(1);
  player2 = new Player(2);
  banner = new EndingBanner();
  rectMode(CORNER);
  imageMode(CORNER);
}

void draw() {
  background.preDraw();
  player1.draw();
  player2.draw();
  background.postDraw();
  
  if (banner.showScore) {
    text("score: " + player1.points, 50, 30);
    text("score: " + player2.points, 350, 30);
  }
  
  text("Ammo: " + player1.gun.ammo, 50, 50);
  text("Ammo: " + player2.gun.ammo, 350, 50);
  
  if (player1.didHit(player2.target)) {
    banner.start(1);
    player1.bullets.clear();
    player2.bullets.clear();
  }
  
  if (player2.didHit(player1.target)) {
    banner.start(2);
    player1.bullets.clear();
    player2.bullets.clear();
  }
  
  banner.draw();
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
  
  if (keyCode == TAB) {
    player1.fire();
  }
  if (keyCode == 'R') {
    player2.fire();
  }
}
