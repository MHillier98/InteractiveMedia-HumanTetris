  import processing.sound.*;
  
  SoundFile correctSnd;
  SoundFile incorrectSnd;
  
  int xbox = 50;
  int ybox =50;
   
  int now = 0;
  int delay = 10000;
  int val;
  char keyVal;
  int score = 0;
  boolean isCorrect = false;
  
void setup(){
  size (800,800);
  correctSnd = new SoundFile( this, "NFF-got-mail-b.wav");
  incorrectSnd = new SoundFile( this, "NFF-no-go.wav");
  now = millis();
  drawbox();
}

void draw(){
  textSize(32);
  text("Score", 10,30);
  text(score, 10, 60);
  println(score);
  
  text("time", width-100, 30);
  text(int((millis() - now)/1000), width-100, 60);
  println(int((millis() - now)/1000));
  
  if (millis() >= (now+delay)){
     drawbox();
     score = score - 10;
     if (score <0) score = 0;
     now = millis();
     incorrectSnd.play();
  }

}

void drawbox(){
  background (255,200,200);
  val = int(random(3.5));
  switch(val){
   case 1 : 
     keyVal = '1';
     box1();
     break;
   case 2:
     keyVal = '2';
     box2();
     break;
   case 3:
     keyVal = '3';
     box3();
     break;
   default :
     keyVal = '1';
     box1();
     break;
  }
}

void box1(){
 fill(255);
 rect(width/2, height/2, xbox, ybox);
 //correct.play();    
 
}

void box2(){
 fill(255);
 rect(width/2, height/2, xbox, ybox);
 rect(width/2, height/2+ybox, xbox,ybox);
 
}
void box3(){
 fill(255);
 rect(width/2, height/2, xbox, ybox);
 rect(width/2, height/2+ybox, xbox,ybox);
 rect(width/2-xbox, height/2+ybox, xbox,ybox);
}

void keyPressed(){
   if (key == keyVal) {
        correctSnd.play();
        score = score + 10 - int((millis() - now)/1000);
        drawbox();
        isCorrect = true;
   } else {
     isCorrect = false;
   }
}
