int[] x,y;

void setup(){
  size(800,800);
  x = new int[30];
  y = new int[10];
  for (int i=0;i<x.length;i++){
    x[i] = int(i * 100);
  }
}


void draw(){
  background(225);
  noFill();
  stroke(0);
  strokeWeight(25);
  for (int i=0;i<x.length;i++){
    ellipse(800,800,x[i],x[i]);
  }
  
}