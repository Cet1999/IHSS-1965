/**
PFont font1;
void setup()
{
  size(800,800);
  font1 = createFont("Monaco",36);
  textFont(font1);
}

void draw()
{
  background(0);
  stroke(255);
  rotate(radians(45));
  text("Hello",100,100);
}


PImage puck;
void setup()
{
  size(800,800);
  puck = loadImage("Puckman.jpg");
}

void draw()
{
  background(0);
  image(puck,100,100);
}

int[]a = {5,4,3,2,1};
void setup()
{
  size(800,800);
  println(a[2]);
}
**/
int[] x,y;

void setup()
{
  size(800,800);
  x = new int[20];
  for (int i=0; i<x.length; i++)
    x[i]=(i*20)+20;
  y = new int[20];
  for (int i=0; i<y.length; i++)
    y[i]=(i*20)+20;
}

void draw()
{
  for (int i=0; i<x.length; i++)
    for (int j=0; j<y.length; j++)
      ellipse(x[i],y[j],20,20);
}