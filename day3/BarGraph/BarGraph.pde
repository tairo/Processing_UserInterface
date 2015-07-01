float a = 20; //percent
float b = 70; //percent
float c = 10; //percent

float w = 280;

void setup(){
  size(320,240);
}

void draw(){
  background(255);

  fill(255,255,255);
  rect(20,90,w,60);

  fill(255,255,0);
  rect(20,90,w*a/100,60);

  //fill(0,0,0);
  //rect(20+w*a/100-2,90,4,60);

  fill(255,0,0);
  rect(20+w*a/100,90,w*b/100,60);

  fill(255,0,255);
  rect(20+w*a/100+w*b/100,90,w*c/100,60);
}

