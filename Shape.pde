class Shape{
  int x;
  int y;
  int rectSize;
  String type;
  
  Shape(int x, int y, int rectSize, String type){
    this.x = x;
    this.y = y;
    this.rectSize = rectSize;
    this.type = type;
  }
  
  void setType(String type) {
    this.type = type;
  }
  
  void drawShape(){
    Shapes shapes = new Shapes();

    if( type == "S"){ shapes.tetrisS(x, y, rectSize); }
    else if (type == "O"){ shapes.tetrisO(x, y, rectSize); }
    else if (type == "I"){ shapes.tetrisI(x, y, rectSize); }
    else if (type == "L"){ shapes.tetrisL(x, y, rectSize); }
    else if (type == "T"){ shapes.tetrisT(x, y, rectSize); }
    else if (type == "J"){ shapes.tetrisJ(x, y, rectSize); }
    else{ shapes.tetrisZ(x, y, rectSize); }
  }
  
  void setSize(int newRectSize){
    rectSize = newRectSize;
  }
  
  void setCoordinates(int x, int y){
    this.x = x;
    this.y = y;
  }
}
