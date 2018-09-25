int rectSize = 50;
int xStartPos = 200;
int yStartPos = 200;

Shape shape= new Shape();

void setup()
{
  size(640, 480);
  background(0);
}


void draw()
{
  fill(255);
  stroke(204, 102, 0);
  strokeWeight(2);
  shape.setType("O");
  shape.setCoordinates(200, 200);
  shape.setSize(50);
  shape.drawShape();
}
