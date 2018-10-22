class Timer {
  float time;

  Timer(float set) {
    time = set;
  }

  int getTime() {
    return (int)time;
  }

  void setTime(float set) {
    time = set;
  }

  //Update timer by counting down, called in the draw() method to work
  void countDown() {
    time -= 1/frameRate;
  }
}
