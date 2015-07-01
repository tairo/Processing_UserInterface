float a = 1;
float b = 30;
float c = 0;
float dx = 0.1;

float click_point_x = 0;
float click_point_y = 0;
float drag_point_x = 0;
float drag_point_y = 0;

int g_r = 0;
int g_g = 0;
int g_b = 255;

int graph_area_size_w = 500;
int graph_area_size_h = 500;
int margine_w = 20;
int margine_h = 20;
int origin_x = graph_area_size_w / 2 + margine_w;
int origin_y = graph_area_size_h / 2 + margine_h;

int tic_len = 3;

PrintWriter output;

void setup(){
  //size(graph_area_size_w + 2*margine_w, graph_area_size_h + 2*margine_h);
  size(540,540);
  output = createWriter("positions.txt"); 
  
  // HTML Table
  output.print("<TABLE BORDER=1>\n");

}

void draw_button(){
  stroke(0,0,0);
  fill(0,0,255);
  rect(30, 5, 10, 10);
  fill(0,255,0);
  rect(45, 5, 10, 10);
  fill(255,0,0);
  rect(60, 5, 10, 10);

}

void draw_axis(){
  stroke(0,0,0);
  fill(255);
  rect(margine_w, margine_h,
       graph_area_size_w, graph_area_size_h);
  line(margine_w, graph_area_size_h/2 + margine_h,
       graph_area_size_w + margine_w, graph_area_size_h/2 + margine_h);
  line(graph_area_size_w/2 + margine_w, margine_h,
       graph_area_size_w/2 + margine_w, graph_area_size_h + margine_h);

  // X Arrow       
  line(graph_area_size_w/2 + margine_w, margine_h, graph_area_size_w/2 + margine_w - tic_len, margine_h + 10);
  line(graph_area_size_w/2 + margine_w, margine_h, graph_area_size_w/2 + margine_w + 5, margine_h + 10);

  // Y Arrow       
  line(graph_area_size_w + margine_w, graph_area_size_h/2 + margine_h, graph_area_size_w + margine_w - 10, graph_area_size_h/2 + margine_h - 5);
  line(graph_area_size_w + margine_w, graph_area_size_h/2 + margine_h, graph_area_size_w + margine_w - 10, graph_area_size_h/2 + margine_h + 5);

  // Text
  PFont font = createFont("FFScala", 14); 
  textFont(font); 
  fill(0, 0, 0);

  // X Label
  text("x", graph_area_size_w + margine_w - 20, graph_area_size_h/2 + margine_h - 15);

  // Y Label
  text("y", graph_area_size_w/2 + margine_w + 15, margine_h + 20);
  
  // ORIGIN Label
  text("O", origin_x - 20, origin_y - 10);

  int x_tic_count = (graph_area_size_w/2) / 10;
  int y_tic_count = (graph_area_size_h/2) / 10;

  // X tics
  for(int i = 0; i < x_tic_count; i++){
    line(origin_x - i*10, origin_y - tic_len, origin_x - i*10, origin_y + tic_len);
    line(origin_x + i*10, origin_y - tic_len, origin_x + i*10, origin_y + tic_len);
  }
  
  // Y tics
  for(int i = 0; i < y_tic_count; i++){
    line(origin_x - tic_len, origin_y - i*10, origin_x + tic_len, origin_y - i*10);
    line(origin_x - tic_len, origin_y + i*10, origin_x + tic_len, origin_y + i*10);
  }
}

void plot_graph(){
  for(float x = - graph_area_size_w / 2; x <= graph_area_size_w/2; x = x + dx){
    float y = a*(x - (click_point_x - origin_x)) - click_point_y + origin_y;
    if(origin_y - y >= margine_h && origin_y - y <= margine_h + graph_area_size_h){
      point(origin_x + x, origin_y - y);
    }
  }
}

void plot_graph2(){
  for(float x = - graph_area_size_w / 2; x <= graph_area_size_w/2; x = x + dx){
    float y = a*x*x/4 + b*x + c;
    if(origin_y - y >= margine_h && origin_y - y <= margine_h + graph_area_size_h){
      point(origin_x + x, origin_y - y);
    }
  }
}

void draw(){
  background(255);
  draw_axis();
  draw_button();
  
  //output.print("X = "+mouseX+"\n");
  //output.print("Y = "+mouseY+"\n");

  // CSV
  //output.print(mouseX+","+mouseY+"\n");
  
  // IAG
  //output.print("("+mouseX+" "+mouseY+")\n");
  
  // HTML Table
  output.print("<TR><TD>"+mouseX+"</TD><TD>"+mouseY+"</TD></TR>\n");
  
  
  
  noFill();
  stroke(g_r, g_g, g_b);
  plot_graph();
//  stroke(255,0,0);
//  plot_graph2();
  
  // Draw circle at clicked point
  if((mouseX < margine_w || mouseX > margine_w+graph_area_size_w)&&
     (mouseY < margine_h || mouseY > margine_h+graph_area_size_h)){
     }
     else{
  stroke(0,255,0);
  fill(0,255,0);
  ellipse(click_point_x, click_point_y, 10, 10);
  stroke(255,0,0);
  line(click_point_x, click_point_y, drag_point_x, drag_point_y);
     }
}

void keyPressed() {
  output.print("</TABLE>\n");
  
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}

void mousePressed() {
    click_point_x = mouseX;
    click_point_y = mouseY;
     if((mouseX > 30 && mouseX < 40) && (mouseY > 5 && mouseY < 15)){
       g_r = 0;
       g_g = 0;
       g_b = 255;
     }
     
    if((mouseX > 45 && mouseX < 55) && (mouseY > 5 && mouseY < 15)){
       g_r = 0;
       g_g = 255;
       g_b = 0;
    }

    if((mouseX > 60 && mouseX < 70) && (mouseY > 5 && mouseY < 15)){
       g_r = 255;
       g_g = 0;
       g_b = 0;
    }

  if((mouseX < margine_w || mouseX > margine_w+graph_area_size_w)&&
     (mouseY < margine_h || mouseY > margine_h+graph_area_size_h)){
 }
  else{
    click_point_x = mouseX;
    click_point_y = mouseY;
    drag_point_x = mouseX;
    drag_point_y = mouseY;
  }
}

void mouseDragged() 
{
  if((mouseX < margine_w || mouseX > margine_w+graph_area_size_w)&&
     (mouseY < margine_h || mouseY > margine_h+graph_area_size_h)){
       
  }
  else{
    drag_point_x = mouseX;
    drag_point_y = mouseY;
  }
}

void mouseReleased() {
  if((mouseX < margine_w || mouseX > margine_w+graph_area_size_w)&&
     (mouseY < margine_h || mouseY > margine_h+graph_area_size_h)){
       
  }
  else{
    a = (click_point_y - drag_point_y)/(drag_point_x - click_point_x);
    drag_point_x = click_point_x;
    drag_point_y = click_point_y;
  }
}
