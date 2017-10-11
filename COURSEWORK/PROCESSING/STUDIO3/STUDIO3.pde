//line(x1,y1,x2,y2)
//triangle(x1,y1,x2,y2,x3,y3)
//quad(x1,y1,x2,y2,x3,y3,x4,y4)
//arc(x,y,width,height,startradians,endradians)
//translate(x,y)move the whole screen by x and y

void setup(){
  size(800,800);
}


void draw(){
  size(800,800);
//  background(255);
  fill(153,255,0);
  rotate(radians(30));
//  scale(0.5);
//  translate(700,200);
//  strokeWeight(4);
//  line(0,800,400,400);
//  triangle(0,800,400,400,600,600);
//  rectMode(CENTER);
//  rect(400,400,200,200);
//  ellipseMode(CORNER);
//  ellipse(0,0,100,100);
  quad(100,100,100,107,300,400,450,500);
//  arc(300,400,400,400,0,PI);
//  arc(0,0,400,400,radians(-220),radians(-25));
  pushMatrix();
  quad(100,100,100,107,300,400,450,500);
}