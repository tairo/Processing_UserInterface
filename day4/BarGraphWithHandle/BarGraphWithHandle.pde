float a = 20; //percent
float b = 70; //percent
float c = 10; //percent

float w = 280;

boolean selectBar = false;

float bar1X = w*a/100;
float bar2X = w*a/100+w*b/100;
float bar1moveOriginX = 0;

void setup(){
  size(320,240);
}

void draw(){
  background(255);

  fill(255,255,255);
  rect(20,90,w,60);

  fill(255,255,0);
  rect(20,90,bar1X,60);

  //fill(0,0,0);
  //rect(20+w*a/100-2,90,4,60);

  fill(255,0,0);
  rect(20+bar1X,90,w*b/100,60);

  fill(255,0,255);
  rect(20+bar2X,90,w*c/100,60);
}

void mousePressed(){
   if(!selectBar && mouseX>20+bar1X-2 && mouseX<20+bar1X+2 &&
      mouseY>90 && mouseY<150){
     selectBar = true;
     bar1moveOriginX = mouseX;
   }
}

void mouseDragged(){
    if(selectBar){
      bar1X = mouseX - 20;
    }
}

void mouseReleased(){
    selectBar = false;
}

