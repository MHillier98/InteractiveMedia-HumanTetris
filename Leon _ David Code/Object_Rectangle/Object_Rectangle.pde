float x, y, w, h, cX, maxSize, speed;
boolean secCreated, thirCreated;
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
}

void draw() {
  background(255);
  fill(0);
  rect1.drawRect();
  rect1.moveRect();
  if (rect1.passedQuart() && !secCreated) {//Not running for some reason???
    rect2.drawRect();
    rect2.moveRect();
    secCreated = true;
  }
  if (rect1.passedMiddle() && !thirCreated) {
    rect3.drawRect();
    rect3.moveRect();
    thirCreated = true;
  }
  if (secCreated) { //This one is not running? no red rectangle?
    fill (255,0,0);
    rect2.drawRect();
    rect2.moveRect();
    text("Text", 40, 40);
  }
  if (thirCreated) {
    fill (0,255,0);
    rect3.drawRect();
    rect3.moveRect();
    text("Text2", 80, 80);
  }
  strokeWeight(4);
  line(500,0,500,1500);
  line(1000,0,1000,1500);
}
