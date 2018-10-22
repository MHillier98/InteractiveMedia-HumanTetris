Timer timer;
PFont endFont, timeFont;
boolean gameEnded;

void setup() {
  size(1500, 1500);
  timer = new Timer(10);
  endFont = createFont("Chicle.ttf", 100);
  timeFont = createFont("Chicle.ttf", 50);
  gameEnded = false;
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
  }
}

void mouseClicked() {
  if (!gameEnded) {
    timer.setTime(10);
  }
}
