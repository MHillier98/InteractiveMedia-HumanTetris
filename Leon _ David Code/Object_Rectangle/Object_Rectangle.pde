float x, y, w, h, cX, maxSize, speed;
boolean secCreated, thirCreated, completed, gameEnded;
Rectangle rect1, rect2, rect3;
Timer timer;
PFont endFont, timeFont;

void setup() {
  size(1500, 1500);
  h = 50;
  w = 50;
  y = height/2 - h/2;
  x = width;
  maxSize = 5;
  speed = 20;
  rect1 = new Rectangle(x, y, h, w, maxSize, speed);
  rect2 = new Rectangle(x, y, h, w, maxSize, speed);
  rect3 = new Rectangle(x, y, h, w, maxSize, speed);
  secCreated = false;
  thirCreated = false;
  gameEnded = false;
  completed = true;
  timer = new Timer(11);
  endFont = createFont("Chicle.ttf", 100);
  timeFont = createFont("Chicle.ttf", 50);
}

void draw() {
  background(255);
  fill(0);
  if (timer.getTime() < 0) {
    textFont(endFont);
    textAlign(CENTER, CENTER);
    text("Game Over!!!", height/2, width/2);
    gameEnded = true;
  }
  else {
    timer.countDown();
    textFont(timeFont);
    text("Time: " + timer.getTime(), height/40, width/40);
    fill(255, 0, 0); //Red
    rect1.drawRect();
    fill(0, 255, 0); //Green
    rect2.drawRect();
    fill(0, 0, 255); //Blue
    rect3.drawRect();
  }
  if (completed) {
    rect1.moveRect();
    if (rect1.passedTwoThird() && !secCreated) {
      rect2.moveRect();
      secCreated = true;
    }
    if (rect1.passedOneThird() & !thirCreated) {
      rect3.moveRect();
      thirCreated = true;
    }
    if (secCreated) {
      rect2.moveRect();
      secCreated = true;
    }
    if (thirCreated) {
      rect3.moveRect();
      thirCreated = true;
    }
    strokeWeight(4);
    if (rect1.atMiddle() || rect2.atMiddle() || rect3.atMiddle()) {
      completed = false;
    }
  }
}

void mouseClicked() {
  if (!gameEnded) {
  completed = true;
  timer.setTime(11);
  }
}
