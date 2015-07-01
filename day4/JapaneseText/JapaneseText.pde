PFont myFont48;
PFont myFont24;

void setup(){
  size( 600, 400 );
  myFont48 = loadFont( "azukifontL-48.vlw" ); // 作成したフォントを読み込む
  myFont24 = loadFont( "azukifontL-24.vlw" ); // 作成したフォントを読み込む
}
 
void draw(){
  background( 245 );
   
  textFont( myFont48 );
  fill( 60 );
  text("こんにちは", 150, 100 );
  text("今日は雨です", 150, 160 );
  textFont( myFont24 );
  text("梅雨の季節は，どうも調子が出ませんね", 100, 210 );
}
