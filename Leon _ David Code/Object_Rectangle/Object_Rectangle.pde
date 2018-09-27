float x, y, w, h, cX, maxSize, speed;
boolean secCreated, thirCreated, completed;
Rectangle rect1, rect2, rect3;

void setup() {
  size(1500, 1500);
  h = 50;
  w = 50;
  y = height/2 - h/2;
  x = width;
  maxSize = 1;
  speed = 5;
  rect1 = new Rectangle(x, y, h, w, maxSize, speed);
  rect2 = new Rectangle(x, y, h, w, maxSize, speed);
  rect3 = new Rectangle(x, y, h, w, maxSize, speed);
  secCreated = false;
  thirCreated = false;
  completed = true;
}

void draw() {
  if (completed) {
    background(255);
    fill(255, 0, 0); //Red
    rect1.drawRect();
    rect1.moveRect();
    if (rect1.passedTwoThird() && !secCreated) {//Not running for some reason???
      fill(0, 255, 0); //Green
      rect2.drawRect();
      rect2.moveRect();
      secCreated = true;
    }
    if (rect1.passedOneThird() & !thirCreated) {
      fill(0, 0, 255); //Blue
      rect3.drawRect();
      rect3.moveRect();
      thirCreated = true;
    }
    if (secCreated) {
      fill(0, 255, 0); //Green
      rect2.drawRect();
      rect2.moveRect();
      secCreated = true;
    }
    if (thirCreated) {
      fill(0, 0, 255); //Blue
      rect3.drawRect();
      rect3.moveRect();
      thirCreated = true;
    }
    strokeWeight(4);
    line(500,0,500,1500);
    line(1000,0,1000,1500);
    if (rect1.atMiddle() || rect2.atMiddle() || rect3.atMiddle()) {
      completed = false;
    }
  }
}

void mouseClicked() {
  completed = true;
}
