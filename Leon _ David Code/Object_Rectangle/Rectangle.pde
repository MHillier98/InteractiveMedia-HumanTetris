class Rectangle {
  float initalX, initialY, h, w, cX, maxSize, speed, initialH, initialW;
  Rectangle(float x, float y, float h, float w, float maxSize, float speed) {
    this.initalX = x;
    this.initialY = y;
    this.h = h;
    this.w = w;
    this.maxSize = maxSize;
    this.speed = speed;
    this.initialH = h;
    this.initialW = w;
  }
  
  float getX() {
    return initalX;
  }
  
  float getY() {
    return initialY;
  }
  
  float getH() {
    return h;
  }
  
  float getW() {
    return w;
  }
  
  boolean passedMiddle() {
    cX = width/2 - w/2;
    if (initalX < cX) {
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean passedQuart() {
    cX = width/2 - w/2;
    if (width/3 > cX) {
      return true;
    }
    else {
      return false;
    }
  }
  
  void setX(float x) {
    this.initalX = x;
  }
  
  void setY(float y) {
    this.initialY = y;
  }
  
  void setH(float h) {
    this.h = h;
  }
  
  void setW(float w) {
    this.w = w;
  }
  
  void drawRect() {
    rect(initalX, initialY, h, w);
    setX(getX()-speed);
    setY(height/2 - getH()/2);
  }
  
  void moveRect() {
    if (passedMiddle()) {
    setW(getW() - maxSize);
    setH(getH() - maxSize);
    }
    else {
      setW(getW() + maxSize);
      setH(getH() + maxSize);
    }
    if ((getW()+getW()) < 0) {
      setX(width);
      setW(initialW);
      setH(initialH);
    }
  }
}
