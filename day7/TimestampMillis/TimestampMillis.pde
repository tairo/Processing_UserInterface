int mili = 0;
int lastmili = 0;
int lastsec = 0;

void setup(){
  lastsec = second();
}

String timestamp(){
  int d = day();    // Values from 1 - 31
  int mo = month();  // Values from 1 - 12
  int y = year();   // 2003, 2004, 2005, etc.
  int h = hour();
  int mi = minute();
  int s = second();
  int mili = millis() - lastmili;
  return ""+y+"/"+mo+"/"+d+" "+h+":"+mi+":"+s+":"+mili; 
}

void draw(){
  if(lastsec != second()){
      lastmili = millis();
      lastsec = second();
  }
}

void mouseMoved(){
  print(timestamp());
  println(","+mouseX+","+mouseY);
}
