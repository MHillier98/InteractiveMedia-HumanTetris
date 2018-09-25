int squareWidth = 20;

// [all shapes], [shape], [square pos] 
int[][][] shapeCoordsArr = {
  { // T
    {1, 1}, {2, 1}, {3, 1},
            {2, 0}
  },
  { // Line
    {0, 3},
    {0, 2},
    {0, 1},
    {0, 0}
  },
  { // L
    {0, 2},
    {0, 1},
    {0, 0}, {1, 0}
    
  },
  { // Square
    {0, 1}, {1, 1},
    {0, 0}, {1, 0}
    
  },
  { // Z
    {0, 1}, {1, 1},
            {1, 0}, {2, 0}
  }
};

void setup() {
  size(600, 600);
  int xOffset = 0;
  
  PGraphics pg;
  pg = createGraphics(600, 600);
  background(204);
  pg.beginDraw();
  
  for (int i = 0; i < shapeCoordsArr.length; i++) {
    println("// Shape #" + i);
    pg.stroke(0); // Setting the outline (stroke) to black
    pg.fill(random(255), random(255), random(255)); // Setting the interior fill of a shape to a random colour
  
    for (int f = 0; f < shapeCoordsArr[i].length; f++) {
      println(f + "= {" + shapeCoordsArr[i][f][0] + ", " + shapeCoordsArr[i][f][1] + "}");
      pg.rect(xOffset + shapeCoordsArr[i][f][0]*squareWidth, shapeCoordsArr[i][f][1]*squareWidth, squareWidth, squareWidth);
    }  
    
    xOffset += 100;
    println("\n");
  }
  
    pg.endDraw();
    image(pg, 100, 300); 
}
