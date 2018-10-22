class Shapes{
  void tetrisO(int x,int y,int rectSize) {
    fill(226, 155, 54);
    rect(x, y, rectSize, rectSize);
    rect(x + rectSize, y, rectSize, rectSize);
    rect(x + rectSize, y + rectSize, rectSize, rectSize);
    rect(x, y + rectSize, rectSize, rectSize);
  }
  
  void tetrisI(int x,int y,int rectSize){
    fill(99, 26, 155);
    rect(x, y, rectSize, rectSize);
    rect(x, y + rectSize, rectSize, rectSize);
    rect(x, y + rectSize*2, rectSize, rectSize);
    rect(x, y + rectSize*3, rectSize, rectSize);  
  }
  
  void tetrisS(int x,int y,int rectSize){
    fill(58, 191, 206);
    rect(x, y, rectSize, rectSize);
    rect(x + rectSize, y + rectSize, rectSize, rectSize);
    rect(x, y + rectSize, rectSize, rectSize);
    rect(x+ rectSize, y + rectSize*2, rectSize, rectSize);
  }
  
  void tetrisL(int x,int y,int rectSize) {
    fill(57, 122, 20);
    rect(x, yStartPos, rectSize, rectSize);
    rect(x, yStartPos + rectSize, rectSize, rectSize);
    rect(x, yStartPos + rectSize*2, rectSize, rectSize);
    rect(x + rectSize, yStartPos + rectSize*2, rectSize, rectSize);
  }
  
  void tetrisT(int x,int y,int rectSize) {
    fill(206, 196, 57);
    rect(x, y, rectSize, rectSize);
    rect(x + rectSize, y, rectSize, rectSize);
    rect(x + rectSize, y + rectSize, rectSize, rectSize);
    rect(x + rectSize*2, y, rectSize, rectSize);
  }
  
  void tetrisJ(int x,int y,int rectSize) {
    fill(198, 57, 60);
    rect(x + rectSize, y, rectSize, rectSize);
    rect(x + rectSize, y + rectSize, rectSize, rectSize);
    rect(x + rectSize, y + rectSize*2, rectSize, rectSize);
    rect(x, y + rectSize*2, rectSize, rectSize);
  }
  
  void tetrisZ(int x,int y,int rectSize) {
    fill(226, 120, 193);
    rect(x + rectSize, y, rectSize, rectSize);
    rect(x, y + rectSize, rectSize, rectSize);
    rect(x + rectSize, yStartPos + rectSize, rectSize, rectSize);
    rect(x, y + rectSize*2, rectSize, rectSize);
  }
}
