class Rectangle {
  float x, y, h, w, cX, maxSize, speed, initialH, initialW, eX;
  boolean beforeMiddle;
  Rectangle(float x, float y, float h, float w, float maxSize, float speed) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
    this.maxSize = maxSize;
    this.speed = speed;
    this.initialH = h;
    this.initialW = w;
    beforeMiddle = true;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getH() {
    return h;
  }
  
  float getW() {
    return w;
  }
  
  boolean passedOneThird() {
    cX = x + w/2 ; //X coordinate of center of rect
    if (width/3 > cX) {
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean passedTwoThird() {
    cX = x + w/2; //X coordinate of center of rect
    if (2*width/3 > cX) {
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean passedMiddle() {
    cX = x + w/2 ;
    if (width/2 > cX) {
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean atMiddle() {
    cX = x + w/2 ;
    if ((width/2 > cX) && beforeMiddle) {
      beforeMiddle = false;
      return true;
    }
    else {
      return false;
    }
  }
  
  void setX(float x) {
    this.x = x;
  }
  
  void setY(float y) {
    this.y = y;
  }
  
  void setH(float h) {
    this.h = h;
  }
  
  void setW(float w) {
    this.w = w;
  }
  
  void drawRect() {
    rect(x, y, h, w);
  }
  
  void moveRect() {
    eX = x + w ; //X coordinate of top right corner of rect
    setX(getX()-speed);
    setY(height/2 - getH()/2);
    if (passedMiddle()) {
    setW(getW() - maxSize);
    setH(getH() - maxSize);
    }
    else {
      setW(getW() + maxSize);
      setH(getH() + maxSize);
    }
    if (eX < 0) {
      setX(width);
      setW(initialW);
      setH(initialH);
      beforeMiddle = true;
    }
  }
}
