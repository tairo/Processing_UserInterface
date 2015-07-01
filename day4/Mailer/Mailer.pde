float originX = 10;
float originY = 10;
float mainWindowWidth = 620;
float mainWindowHeight = 220;
float mailboxWidth = 75;
float mailboxHeight = 40;
float titleWidth = 200;
float titleHeight = 20;

String[] mailboxName = new String[5];

String[] mailFrom = new String[10];
String[] mailSubject = new String[10];
String[] mailDate = new String[10];
String[] mailBody = new String[10];

void setup(){
  size(640, 240);
}

void draw(){
  background(255);

  //Draw Main Window
  rect(originX,originY,mainWindowWidth,mainWindowHeight);
  line(originX+mailboxWidth,originY,originX+mailboxWidth,originY+mainWindowHeight);
  line(originX+mailboxWidth+titleWidth,originY,originX+mailboxWidth+titleWidth,originY+mainWindowHeight);

  //Draw Mail box
  rect(originX,originY,mailboxWidth,mailboxHeight);
  line(originX+mailboxWidth-10,originY+10,originX+mailboxWidth-2,originY+mailboxHeight/2);
  line(originX+mailboxWidth-10,originY+mailboxHeight-10,originX+mailboxWidth-2,originY+mailboxHeight/2);
  
  //Draw Mail title
  for(int i=0;i<5;i++){
    rect(originX+mailboxWidth,originY+i*titleHeight,titleWidth,titleHeight);
    line(originX+mailboxWidth+titleWidth-5,originY+i*titleHeight+5,originX+mailboxWidth+titleWidth-2,originY+i*titleHeight+titleHeight/2);
    line(originX+mailboxWidth+titleWidth-5,originY+i*titleHeight+titleHeight-5,originX+mailboxWidth+titleWidth-2,originY+i*titleHeight+titleHeight/2);
  }
}


