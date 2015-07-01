float a = 1;
float b = 0;
float xx = 0;
float yy = 0;
float px;
float py;

boolean buttonChecked = false;

float[] x = new float[256];
float[] y = new float[256];
int dotCount = 0;

PFont f;

void setup(){
  size(320, 240);

  // Create the font
  printArray(PFont.list());
  f = createFont("Georgia", 24);
  textFont(f);
}

void draw(){
  background(255);

  // Draw Dot
  for(int i=0;i<dotCount;i++){
    ellipse(x[i],y[i],1,1);
  }
  
  fill(0);
  text(dotCount, 50, 50);

  // Button
  rect(10,10,10,10);
  if(buttonChecked){
    line(10,10,20,20);
    line(20,10,10,20);
  }
  
}

float offsetX(float var){
  return var+160;
}

float offsetY(float var){
  return -var+120;
}

void mousePressed(){
}

void mouseDragged(){
}

void mouseClicked(){
  println(mouseX,",",mouseY);
    
  x[dotCount] = mouseX;
  y[dotCount] = mouseY;
  dotCount++; // dotCount = dotCount + 1;
  
  if(mouseX>=10 && mouseX<=20 && mouseY>=10 && mouseY<=20){
    if(buttonChecked){
      buttonChecked = false;
    }
    else{
      buttonChecked = true;
    }
  }
  else{
    xx = mouseX-160;
    yy = -1*(mouseY-120);
  }
}
