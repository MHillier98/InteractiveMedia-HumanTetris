import processing.sound.*;

SoundFile sound;
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
boolean genRandomVal = true;
int t;
int ten =10;
  
void setup(){
  size (800,800);
  correctSnd = new SoundFile( this, "NFF-got-mail-b.wav");
  // royalty free music found from: https://www.noiseforfun.com/2012-sound-effects/got-mail-b/
  incorrectSnd = new SoundFile( this, "NFF-no-go.wav");
  // royalty free music found from: https://www.noiseforfun.com/2012-sound-effects/no-go/
  sound = new SoundFile(this, "Puzzle-Game-3_Looping.wav");
  // royalty free music found from: http://soundimage.org/wp-content/uploads/2016/03/Puzzle-Game-3_Looping.mp3
  sound.play();
  now = millis();
  drawbox();
  
}

void draw(){
  drawbox();  
  timer();
   
  if (millis() >= (now+delay)){
     genRandomVal = true;  // reset flag get random shape
     score = score - ten;
     
     if (score <0) score = 0;
     now = millis();
     incorrectSnd.play();
  }

}
void timer(){
  textSize(32);
  text("Score", 10,30);
  text(score, 10, 60);
  println(score);
  
  t = ten-int((millis()-now)/1000);
  if (t <= 0){
     t = ten;
  }  
    
  println(t);
  text("time", width-100, 30);
  text(t, width-100, 65);
}

void keyPressed(){
   if (key == keyVal) {
      genRandomVal = true;  // reset flag get random shape
      correctSnd.play();
      score = score + ten - int((millis() - now)/1000);
      drawbox();
      isCorrect = true;
      now = millis();
      
   } else {
     isCorrect = false;
   }
}

void drawbox(){
  background (255,200,200);
  if (genRandomVal) {
    val = int(random(5.9));
    genRandomVal = false;
  }
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
   case 4:
     keyVal = '4';
     box4();
     break;
   case 5:
     keyVal = '5';
     box5();
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

void box4(){
 fill(255);
 rect(width/2, height/2, xbox, ybox);
 rect(width/2, height/2+ybox, xbox,ybox);
 rect(width/2-xbox, height/2+ybox, xbox,ybox);
 rect(width/2-xbox, height/2, xbox,ybox);
}

void box5(){
 fill(255);
 rect(width/2, height/2, xbox, ybox);
 rect(width/2, height/2+ybox, xbox,ybox);
 rect(width/2, height/2-ybox, xbox,ybox);
 rect(width/2-xbox, height/2, xbox,ybox);
 rect(width/2+xbox, height/2, xbox,ybox);
}
