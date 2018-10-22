class Timer {
  float time;
  
  Timer(float set) {//Constructor
    time = set;
  }
  int getTime() {//Method to return time
    return (int)time;
  }
  void setTime(float set) {//Method to change time
    time = set;
  }
  void countDown() {//Update timer by counting down, called in the draw() method to work
    time -= 1/frameRate;
  }
}
