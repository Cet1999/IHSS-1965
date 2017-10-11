//ellipse (center-x, center-y, width, height) draw a ellipse
//fill(R, G, B); 0-255 fill in with color
//noFill() delete fill
//stroke(R, G, B); 0-255 fill in the outline with color
//noStroke() delete fill
//strokeWeight(x) change width of outline
//rect(center-x,center-y,width,height)
/*
stroke(234, 76, 54);
ellipse (25, 25, 30, 30);
fill (50, 72, 755);
stroke (255, 0, 0);
ellipse (75, 25, 30, 30);
fill (26, 185, 38);
noStroke();
ellipse (50, 80, 30, 30);
*/
void setup(){
  size(500,500);
  //frameRate(3);
}

void draw(){
  //background(0);
  fill( round(random(0,255)),round(random(0,255)),round(random(0,255)));
    ellipse(random(0,500),random(0,500),random(0,100),random(0,100));
    //ellipse(width/2,height/2,random(0,100),random(0,100));

}

/*
void setup(){
  size(500,500);
  noStroke();
  fill(96,181,222);
  rect(0,0,500,500);
  fill(142,142,142);
  rect(50,70,400,400);
  fill(247,237,212);
  rect(100,135,300,300);
  fill(237,177,24);
  rect(160,220,180,180);
}
*/