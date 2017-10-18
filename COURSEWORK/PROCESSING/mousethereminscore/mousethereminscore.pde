import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress sc;

PFont font;
boolean empire = false;
boolean stay = false;
boolean fif = false; 

void setup() {
  size(displayWidth, displayHeight);
  font = loadFont("Monaco-24.vlw");
  textFont(font);
  osc = new OscP5(this, 12321);
  sc = new NetAddress("127.0.0.1", 57120);
}

void draw() {
  background(0);
  
  
  stroke(225,225,0);
  
  strokeWeight(4);
  line(1023,0,1023,height);
  line(1315,0,1315,height);
  line(1381,0,1381,height);
  line(1223,0,1223,height);
  line(1191,0,1191,height);
  line(1100,0,1100,height);
  if (fif) {
    stroke(255, 128, 0);
    strokeWeight(3);
    line(1418, 0, 1418, height);
    line(1211, 0, 1211, height);
    line(1343, 0, 1343, height);
    line(1111, 0, 1111, height);
  }


  if (stay) {
    stroke(255, 0, 255);
    strokeWeight(3);
    line(1693, 0, 1693, height);
    line(1541, 0, 1541, height);
    line(1250, 0, 1250, height);
    line(958, 0, 958, height);
    line(1107, 0, 1107, height);
    line(1846, 0, 1846, height);
  }

  //empire
  if (empire) {
    stroke(255, 255, 0);
    strokeWeight(3);
    line(1024, 0, 1024, height);
    line(659, 0, 659, height);
    line(1257, 0, 1257, height);
    line(1602, 0, 1602, height);
    line(1676, 0, 1676, height);
    line(1257, 0, 1257, height);
  }

  if (mousePressed) {
    stroke(153, 255, 0);
    strokeWeight(1);
    line(mouseX, 0, mouseX, height);
    text(mouseX, width/2, 30);
  }
}

void keyPressed() {
  if (key =='e') {
    empire = true;
    stay = false;
    fif = false;
    osc.send("/empire", new Object[]{}, sc);
  } 
  if (key =='c') {
    empire = false;
    stay = false;
    fif = false;
  }
  if (key =='f') {
    empire = false;
    stay = false;
    fif = true;
    osc.send("/fif", new Object[]{}, sc);
  }
  if (key =='s') {
    empire = false;
    stay = true;
    fif= false;
    osc.send("/stay", new Object[]{}, sc);
  }
}