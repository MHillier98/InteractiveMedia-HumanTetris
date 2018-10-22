int rectSize = 50;
int xStartPos = 250;
int yStartPos = 200;
int time;
StringList tetrisTypes = new StringList("O", "I", "S", "L", "T", "J", "Z");
ArrayList<Shape> shapes = new ArrayList<Shape>();

void setup()
{
  size(1000, 480);
  background(0);
  frameRate(2);
}


void draw()
{
  int time = millis();
  background(0);
  stroke(0);
  strokeWeight(2);
  if (millis() > time + 0.1){
    shapes.add(0, randomShape(xStartPos, yStartPos));
    time = millis();
    xStartPos += 160;
    if (shapes.size() > 3){
      shapes.clear();
      xStartPos = 250;
    }

  }
  
  for (int i = 0; i < shapes.size(); i++){
    shapes.get(i).drawShape();
  }
  
}

Shape randomShape(int x, int y) {
  Shape shape = new Shape(x, y, rectSize, tetrisTypes.get(int(random(0,7))));
  return shape;
}
