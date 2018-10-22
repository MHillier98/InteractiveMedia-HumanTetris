class Rectangle {
  float x, y, h, w, cX, maxSize, speed, initialH, initialW, eX;
  String shapeLetter;
  boolean beforeMiddle;
  StringList tetrisTypes = new StringList("O", "I", "S", "L", "T", "J", "Z");

  Rectangle(float x, float y, float h, float w, float maxSize, float speed) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
    this.maxSize = maxSize;
    this.speed = speed;
    this.initialH = h;
    this.initialW = w;

    newRandomShape();
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
    } else {
      return false;
    }
  }

  boolean passedTwoThird() {
    cX = x + w/2; //X coordinate of center of rect
    if (2*width/3 > cX) {
      return true;
    } else {
      return false;
    }
  }

  boolean passedMiddle() {
    cX = x + w/2 ;
    if (width/2 > cX) {
      return true;
    } else {
      return false;
    }
  }

  boolean atMiddle() {
    cX = x + w/2 ;
    if ((width/2 > cX) && beforeMiddle) {
      beforeMiddle = false;

      if (initialW % 20 > 0) {
        setX((width/2)-w);
      }
      return true;
    } else {
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

  void newRandomShape() {
    String tempShape = tetrisTypes.get(int(random(0, 7)));

    while (this.shapeLetter == tempShape) {
      tempShape = tetrisTypes.get(int(random(0, 7)));
    }

    this.shapeLetter = tempShape;
  }

  String getShape() {
    return this.shapeLetter;
  }

  void drawRect() {
    Shape shape = new Shape((int)x, (int)y, (int)h, shapeLetter);
    shape.drawShape();
  }

  void moveRect() {
    eX = x + w ; //X coordinate of top right corner of rect
    setX(getX()-speed);
    setY(height/2 - getH());
    if (passedMiddle()) {
      setW(getW() - maxSize);
      setH(getH() - maxSize);
    } else {
      setW(getW() + maxSize);
      setH(getH() + maxSize);
    }
    
    if (eX < 0) {
      setX((width-(w/2)));
      setW(initialW);
      setH(initialH);
      beforeMiddle = true;
      newRandomShape();
    }
  }
}
