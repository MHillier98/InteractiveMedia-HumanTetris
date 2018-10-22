float x, y, w, h, cX;
boolean passedMiddle;

void setup() {
  size(1500, 1500);
  h = 50;
  w = 50;
  y = height/2 - h/2;
  x = 1500;
  passedMiddle = false;
}

void draw() {
  background(255);
  fill(0);
  rect(x, y, w, h);
  x -= 2;
  cX = width/2 - w/2;
  if (x < cX) {
    passedMiddle = true;
  }
  if (passedMiddle) {
    w -= 0.5;
    h -= 0.5;
  }
  else {
    w += 0.5;
    h += 0.5;
  }
  y = height/2 - h/2;
}
