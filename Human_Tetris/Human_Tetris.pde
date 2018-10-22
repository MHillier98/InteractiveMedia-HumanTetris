import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;
import processing.sound.*;

// Kinect + Skeleton
Kinect kinect;
ArrayList <SkeletonData> bodies;

// Shapes, animation
float x, y, w, h, cX, maxSize, speed;
boolean secCreated, thirCreated, completed, gameEnded;
Rectangle rect1, rect2, rect3;

StringList tetrisTypes = new StringList("O", "I", "S", "L", "T", "J", "Z");
String currentShape = "";

// Utility classes
Timer timer;
Points points;

// Font
PFont endFont, timeFont;

// Sound
SoundFile sound;
SoundFile correctSnd;
SoundFile incorrectSnd;

void setup() {
  size(900, 900);

  h = 40;
  w = 40;
  y = height/2 - 40;
  x = width;
  maxSize = 2;
  speed = 20;

  rect1 = new Rectangle(x, y, h, w, maxSize, speed);
  rect2 = new Rectangle(x, y, h, w, maxSize, speed);
  rect3 = new Rectangle(x, y, h, w, maxSize, speed);

  secCreated = false;
  thirCreated = false;
  gameEnded = false;
  completed = true;

  timer = new Timer(11);
  points = new Points(0);

  endFont = createFont("PressStart2P.ttf", 50);
  timeFont = createFont("PressStart2P.ttf", 50);

  kinect = new Kinect(this);
  smooth();
  bodies = new ArrayList<SkeletonData>();

  correctSnd = new SoundFile( this, "NFF-got-mail-b.wav"); // royalty free music found from: https://www.noiseforfun.com/2012-sound-effects/got-mail-b/
  incorrectSnd = new SoundFile( this, "NFF-no-go.wav"); // royalty free music found from: https://www.noiseforfun.com/2012-sound-effects/no-go/
  sound = new SoundFile(this, "Puzzle-Game-3_Looping.wav"); // royalty free music found from: http://soundimage.org/wp-content/uploads/2016/03/Puzzle-Game-3_Looping.mp3
  sound.loop();
}

void draw() {
  background(255);
  fill(0);

  if (timer.getTime() < 0) {
    if (gameEnded == false) {
      sound.stop();
      incorrectSnd.play();
    }

    textFont(endFont);
    textAlign(CENTER, CENTER);
    text("That's it man!\nGame over man!\nGame over!", height/2, width/2);
    gameEnded = true;
  } else {
    timer.countDown();
    textFont(timeFont);
    text("TIME: " + timer.getTime(), width/30, 80);
    text("POINTS: " + points.getScore(), width/4, height-30);

    fill(255, 0, 0); //Red
    rect1.drawRect();
    fill(0, 255, 0); //Green
    rect2.drawRect();
    fill(0, 0, 255); //Blue
    rect3.drawRect();
  }

  // 'completed shape' aka clicked / success
  if (completed) {
    rect1.moveRect();
    if (rect1.passedTwoThird() && !secCreated) {
      rect2.moveRect();
      secCreated = true;
    }
    if (rect1.passedOneThird() & !thirCreated) {
      rect3.moveRect();
      thirCreated = true;
    }
    if (secCreated) {
      rect2.moveRect();
      secCreated = true;
    }
    if (thirCreated) {
      rect3.moveRect();
      thirCreated = true;
    }
    strokeWeight(4);
    if (rect1.atMiddle() || rect2.atMiddle() || rect3.atMiddle()) {
      completed = false;
    }
  }

  if (rect1.getX() > 390 && rect1.getX() < 410) {
    currentShape = rect1.getShape();
    //println(rect1.getX());
    //println("currentShape 1: " + currentShape);
  } else if (rect2.getX() > 390 && rect2.getX() < 410) {
    currentShape = rect2.getShape();
    //println(rect2.getX());
    //println("currentShape 2: " + currentShape);
  } else if (rect3.getX() > 390 && rect3.getX() < 410) {
    currentShape = rect3.getShape();
    //println(rect3.getX());
    //println("currentShape 3: " + currentShape);
  }

  for (int i = 0; i < bodies.size(); i++) {
    SkeletonData skeleData = bodies.get(i);
    checkPositions(skeleData);
    drawSkeleton(skeleData);
  }
}

void mouseClicked() {
  if (!gameEnded) {
    completeShape();
  }
}


void checkPositions(SkeletonData _s) {
  boolean isOutOfSquare = true;

skeletonPosLoop:
  for (PVector sPV : _s.skeletonPositions) {
    boolean sPosInSquare = false;
    float sX = height/3 + sPV.x * height * 0.3;
    float sY = width/3 + sPV.y * width * 0.3;

    //println("sX: " + sX);
    //println("sY: " + sY);

    if (currentShape.equals("O")) {
      if (sX >= 399 && sX <= 573) {
        if (sY >= 361 && sY <= 536) {
          sPosInSquare = true;
        }
      }
    } else if (currentShape.equals("I")) {
      if (sX >= 399 && sX <= 487) {
        if (sY >= 361 && sY <= 707) {
          sPosInSquare = true;
        }
      }
    } else if (currentShape.equals("S")) {
      if (sX >= 399 && sX <= 487) {
        if (sY >= 361 && sY <= 535) {
          sPosInSquare = true;
        }
      }
      if (sX >= 485 && sX <= 573) {
        if (sY >= 447 && sY <= 621) {
          sPosInSquare = true;
        }
      }
    } else if (currentShape.equals("L")) {
      if (sX >= 399 && sX <= 488) {
        if (sY >= 361 && sY <= 622) {
          sPosInSquare = true;
        }
      }
      if (sX >= 488 && sX <= 573) {
        if (sY >= 533 && sY <= 622) {
          sPosInSquare = true;
        }
      }
    } else if (currentShape.equals("T")) {
      if (sX >= 313 && sX <= 573) {
        if (sY >= 361 && sY <= 449) {
          sPosInSquare = true;
        }
      }
      if (sX >= 399 && sX <= 487) {
        if (sY >= 450 && sY <= 535) {
          sPosInSquare = true;
        }
      }
    } else if (currentShape.equals("J")) {
      if (sX >= 399 && sX <= 485) {
        if (sY >= 533 && sY <= 621) {
          sPosInSquare = true;
        }
      }
      if (sX >= 485 && sX <= 573) {
        if (sY >= 361 && sY <= 621) {
          sPosInSquare = true;
        }
      }
    } else if (currentShape.equals("Z")) {
      if (sX >= 485 && sX <= 573) {
        if (sY >= 361 && sY <= 536) {
          sPosInSquare = true;
        }
      }
      if (sX >= 399 && sX <= 488) {
        if (sY >= 447 && sY <= 622) {
          sPosInSquare = true;
        }
      }
    } else {
      print("what is this?");
    }

    if (!sPosInSquare) {
      isOutOfSquare = true;
      break skeletonPosLoop;
    } else {
      isOutOfSquare = false;
    }
  }

  if (!isOutOfSquare) {
    completeShape();
  }
}

void completeShape() {
  correctSnd.play();
  completed = true;
  points.increment();
  timer.setTime(11);
}

void drawSkeleton(SkeletonData _s) {
  // Body
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_HEAD, Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_SPINE, Kinect.NUI_SKELETON_POSITION_HIP_CENTER);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_HIP_CENTER, Kinect.NUI_SKELETON_POSITION_HIP_LEFT);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_HIP_CENTER, Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_HIP_LEFT, Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);

  // Left Arm
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, Kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, Kinect.NUI_SKELETON_POSITION_HAND_LEFT);

  // Right Arm
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);

  // Left Leg
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_HIP_LEFT, Kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, Kinect.NUI_SKELETON_POSITION_FOOT_LEFT);

  // Right Leg
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
  DrawBone(_s, Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
}

void drawPosition(SkeletonData _s) {
  noStroke();
  fill(0, 100, 255);
  String s1 = str(_s.dwTrackingID);
  text(s1, _s.position.x*width, _s.position.y*height);
}

void DrawBone(SkeletonData _s, int _j1, int _j2) {
  noFill();
  //stroke(255, 255, 0);
  if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
    line(width/3 + _s.skeletonPositions[_j1].x*width*0.3, 
      height/3 + _s.skeletonPositions[_j1].y*height*0.3, 
      width/3 + _s.skeletonPositions[_j2].x*width*0.3, 
      height/3 + _s.skeletonPositions[_j2].y*height*0.3);
  }
}

void appearEvent(SkeletonData _s) {
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) {
    return;
  }

  synchronized(bodies) {
    bodies.add(_s);
  }
}

void disappearEvent(SkeletonData _s) {
  synchronized(bodies) {
    for (int i = bodies.size() - 1; i >= 0; i--) {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) {
        bodies.remove(i);
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) {
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) {
    return;
  }
  synchronized(bodies) {
    for (int i = bodies.size() - 1; i >= 0; i--) {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}
