/**
 * Setup and Draw. 
 * 
 * The draw() function creates a structure in which
 * to write programs that change with time. 
 */

PFont fontA;

// Graph sixe
int GW = 350;
int GH = 350;
// Graph axis tic
int TIC = 15;
int TIC_X = 15;
int TIC_Y = 15;

float STEP = 0.01;

int SHOW_NUM = 1;

// Screen size
int SW = GW + 100;
int SH = GH + 100;

//Center of graph
int CX = (SW-GW)/2 + GW/2;
int CY = (SH-GH)/2 + GH/2;
int GX = (SW-GW)/2;
int GY = (SH-GH)/2;

// y = A*(X - B)^2 + C
float A = 1;
float B = 1;
float C = 1;

// The statements in the setup() function 
// execute once when the program begins
void setup() {
  size(SW, SH);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);
  
  fontA = loadFont("Century-12.vlw");
  textAlign(CENTER);

  // Set the font and its size (in units of pixels)
  textFont(fontA, 12);
}

float y = 100;

// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() { 
  background(0);   // Set the background to black
  
  //drawing x axis and y axis
  noFill();
    
  rect(GX, GY, GW, GH);
  line(GX, CY, GX + GW, CY); //x axis
  line(CX, GY, CX, GY + GH); //y axis
  
  int i = -1;
  for(float dx=CX-TIC_X;dx>CX-GW/2;dx=dx-TIC_X){
    line(dx,CY-3,dx,CY+3);
    if(SHOW_NUM == 1) text(i, dx, CY+15);
    i--;
  }
  
  i = 1;
  for(float dx=CX+TIC_X;dx<CX+GW/2;dx=dx+TIC_X){
    line(dx,CY-3,dx,CY+3);
    if(SHOW_NUM == 1) text(i, dx, CY+15);
    i++;
  }

  i = 1;
  for(float dy=CY-TIC_Y;dy>CY-GH/2;dy=dy-TIC_Y){
    line(CX-3,dy,CX+3,dy); 
    if(SHOW_NUM == 1) text(i, CX-10, dy+5);
    i++;
  }

  i = -1;
  for(float dy=CY+TIC_Y;dy<CY+GH/2;dy=dy+TIC_Y){
    line(CX-3,dy,CX+3,dy); 
    if(SHOW_NUM == 1) text(i, CX-12, dy+5);
    i--;
  }

  text('0', CX-10, CY+15);
  text('x', CX+GW/2+10, CY+15);
  text('y', CX-10, CY-GH/2-10);

  // y = x^2
  float dx;
  
  for(dx=-GW/2;dx<=GW/2;dx=dx+STEP){
    float y = (A*(dx - B)*(dx - B) + C)*TIC_Y;
    if(y < GH/2 && y > -GH/2){ 
      //arc(CX+dx*TIC_X,CY-y,1,1,0,TWO_PI);
      point(CX+dx*TIC_X,CY-y);
    }
  }
  
  // draw UI
  // change X TIC
  line(40 + 7, SH - 30, 40 + 7, SH - 30 + 7);
  line(40 + 7, SH - 30, 40, SH - 30 + 3);
  line(40 + 7, SH - 30 + 7, 40, SH - 30 + 3);
  line(50, SH - 30, 50, SH - 30 + 7);
  line(50, SH - 30, 50 + 7, SH - 30 + 3);
  line(50, SH - 30 + 7, 50 + 7, SH - 30 + 3);
  text(TIC_X, 50, SH - 30 - 3);

  // change Y TIC
  line(70 + 7, SH - 30, 70 + 7, SH - 30 + 7);
  line(70 + 7, SH - 30, 70, SH - 30 + 3);
  line(70 + 7, SH - 30 + 7, 70, SH - 30 + 3);
  line(80, SH - 30, 80, SH - 30 + 7);
  line(80, SH - 30, 80 + 7, SH - 30 + 3);
  line(80, SH - 30 + 7, 80 + 7, SH - 30 + 3);
  text(TIC_Y, 80, SH - 30 - 3);

  // toggle Shownum
  rect(100, SH - 30, 7, 7);
  if(SHOW_NUM == 1){
    line(100, SH - 30, 100+7, SH - 30 + 7);
    line(100 + 7, SH - 30, 100, SH - 30 + 7);
  }
  
  // Step
  // change Y TIC
  line(120 + 7, SH - 30, 120 + 7, SH - 30 + 7);
  line(120 + 7, SH - 30, 120, SH - 30 + 3);
  line(120 + 7, SH - 30 + 7, 120, SH - 30 + 3);
  line(130, SH - 30, 130, SH - 30 + 7);
  line(130, SH - 30, 130 + 7, SH - 30 + 3);
  line(130, SH - 30 + 7, 130 + 7, SH - 30 + 3);
  text(STEP, 130, SH - 30 - 3);
} 

void mousePressed() {
  if(mouseX>=GX && mouseX<=GX+GW && mouseY>=GY && mouseY<=GY+GH){
    B = (mouseX - CX)/(float)TIC_X;
    C = (CY - mouseY)/(float)TIC_Y;
  }
  
  if(mouseX>40 && mouseX<=47 && mouseY>=SH - 30 && mouseY<=SH - 30 + 7){
     if(TIC_X>1) TIC_X -= 1;
   }
   else if(mouseX>50 && mouseX<=57 && mouseY>=SH - 30 && mouseY<=SH - 30 + 7){
     TIC_X += 1;
   }
   else if(mouseX>70 && mouseX<=77 && mouseY>=SH - 30 && mouseY<=SH - 30 + 7){
     if(TIC_Y>1) TIC_Y -= 1;
   }
   else if(mouseX>80 && mouseX<=87 && mouseY>=SH - 30 && mouseY<=SH - 30 + 7){
     TIC_Y += 1;
   }
   else if(mouseX>100 && mouseX<=107 && mouseY>=SH - 30 && mouseY<=SH - 30 + 7){
     if(SHOW_NUM == 1){
       SHOW_NUM = 0;
     }
     else{
       SHOW_NUM = 1;
     }
   }
   else if(mouseX>120 && mouseX<=127 && mouseY>=SH - 30 && mouseY<=SH - 30 + 7){
     if(STEP>0.01) STEP -= 0.01;
   }
   else if(mouseX>130 && mouseX<=137 && mouseY>=SH - 30 && mouseY<=SH - 30 + 7){
     STEP += 0.01;
   }
}
