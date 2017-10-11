void setup(){
  size(1000,1000);
}
void draw(){
  background(255,255,255);
  fill(227,16,48);
  rect(200,200,400,10);
  rect(220,180,100,5);
  noStroke();
  pushMatrix();
  translate(10,550);
  rotate(radians(-45));
  fill(250,179,25);
  rect(15,15,70,80);
  rect(120,15,100,80);
  rect(240,15,400,80);
  rect(330,110,190,50);
  rect(400,180,120,100);
  rect(320,250,40,50);
  fill(0);
  rect(15,110,300,270);
  rect(40,400,220,130);
  rect(80,550,100,100);
  fill(58,13,211);
  rect(-70,110,40,220);
  rect(300,440,30,100);
  popMatrix();
  
}