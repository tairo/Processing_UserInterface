float a = 30; //percent
float b = 50; //percent
float c = 20; //percent

void setup(){
  size(320,240);
}

void draw(){
  fill(255,255,0);
  arc(160,120,200,200,0,2*PI*a/100);
  fill(255,0,0);
  arc(160,120,200,200,2*PI*a/100,(a+b)*2*PI/100);
  fill(255,0,255);
  arc(160,120,200,200,(a+b)*2*PI/100,(a+b+c)*2*PI/100);
}

void mouseClicked(){
  println(mouseX,",",mouseY);
  
}
