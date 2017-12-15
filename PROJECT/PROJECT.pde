import processing.serial.*;
import oscP5.*;
import netP5.*;
Serial ino;
OscP5 osc;
NetAddress sc;
float mappedVal;
float cSz = 10; //circle size
void setup(){
  size(500, 500);
  osc = new OscP5(this, 12321);
  sc = new NetAddress("127.0.0.1", 57120);
  printArray( Serial.list() );
  String portName = Serial.list()[0];
  ino = new Serial(this, portName, 9600);
}
void draw(){
  background(0);
  fill(0, 0, 255); //blue
  noStroke();
  cSz = map(mappedVal, 0.0, 1.0, 10, 480);
  ellipse(width/2, height/2, cSz, cSz);
}

void serialEvent(Serial ino){
  String msg = ino.readStringUntil('\r');
  if(msg != null){ //makes sure there are msgs
    msg = trim(msg);
    mappedVal = map( int(msg), 100, 1000, 0.0, 1.0);
    println(mappedVal);
    println(msg);
  }
}

void mousePressed(){
  OscMessage msg = new OscMessage("/test");
  msg.add(200);
  msg.add("kfdjskafjdskl");
  osc.send(msg, sc);
  
  
  
}