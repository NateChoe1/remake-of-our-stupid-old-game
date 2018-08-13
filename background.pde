class Background {
  PImage background, longneck, arm1, arm2;
  
  Background() {
    background = loadImage("sprites\\background.png");
    longneck = loadImage("sprites\\longneck.png");
    arm1 = loadImage("sprites\\arm1.png");
    arm2 = loadImage("sprites\\arm2.png");
  }
  
  void preDraw() {
    background(255);
    fill(0);
    textSize(20);
    image(background, 0, 400);
    image(longneck, 44, 0);
    image(longneck, 435, 0);
    image(arm1, 70, -66);
    image(arm2, 405, -66);
  }
  
  void postDraw() {
    text("controls: QA for first gun, ", 120, 150);
    text("UJ for first target, ", 120, 170);
    text("TG for second gun, ", 120, 190);
    text("[; for second target, ", 120, 210);
    text("tab to shoot the first gun, ", 120, 230);
    text("R to shoot second gun", 120, 250);
    textSize(10);
    text("Created by Nate and Glenn Choe", 0, 10);
    textSize(20);
  }
}
