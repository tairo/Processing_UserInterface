float a = 1;
float b = 0;
float xx = 0;
float yy = 0;
float px;
float py;

float startx;
float starty;
float currentx;
float currenty;

boolean buttonChecked = false;

void setup(){
  size(320, 240);
}

void draw(){
  background(255);

  px = -160;
  py = a*(px-xx)*(px-xx) + yy;
  for(float x = -160 ; x < 160; x+=1){
    float y = a*(x-xx)*(x-xx) + yy;
    if(buttonChecked){
      line(offsetX(px),offsetY(py),offsetX(x),offsetY(y));
    }
    else{
      ellipse(offsetX(x),offsetY(y),1,1);
    }
    px = x;
    py = y;
  }
  
  // Button
  rect(10,10,10,10);
  if(buttonChecked){
    line(10,10,20,20);
    line(20,10,10,20);
  }
  
  // Line
  //line(startx, starty, currentx, currenty);
}

float offsetX(float var){
  return var+160;
}

float offsetY(float var){
  return -var+120;
}

void mousePressed(){
  startx = mouseX;
  starty = mouseY;  
}

void mouseDragged(){
  currentx = mouseX;
  currenty = mouseY;  
}

void mouseClicked(){
  println(mouseX,",",mouseY);
  
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
