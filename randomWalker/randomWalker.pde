import oscP5.*;
import netP5.*;

java.util.Random generator;

GassE g;
//Slider s;

OscP5 oscP5;



float posx;
float posy;
float posz;
float accelx;
float accely;
float accelz;

int sliderPot;
int fsrSense;
int button2;
int button3;
int button4;
Drop[] drops = new Drop[50];
float red;
float green;
float blue;

int diameter=10  ;
float circX;
float circY;

float linePX;
float linePY;
float lineX;
float lineY;

void setup(){
  size(800, 800);
  
  for (int i = 0; i < drops.length; i ++ ) {
  drops[i] = new Drop();
  }
  
  oscP5 = new OscP5(this, 6002);
  oscP5.plug(this, "posX", "/numsX");
  oscP5.plug(this, "posY", "/numsY");
  oscP5.plug(this, "posZ", "/numsZ");
  oscP5.plug(this, "accelX", "/accelX");
  oscP5.plug(this, "accelY", "/accelY");
  oscP5.plug(this, "accelZ", "/accelZ");
  oscP5.plug(this, "slider", "/slider");
  oscP5.plug(this, "fsr", "/fsr");
  oscP5.plug(this, "buttonTwo", "/buttonTwo");
  oscP5.plug(this, "buttonThree", "/buttonThree");
  oscP5.plug(this, "buttonFour", "/buttonFour");
  
  
  smooth();
  generator = new java.util.Random();
  g = new GassE();
  //s = new Slider();
  //background(0);
  //noStroke();
  
}

void draw(){
  background(0);
  if(button2 == 2) {
  
  //g.display(posx, accelx, accely); 
  //g.colors(100, green, blue);
  //println("red", red);
  //g.display(posy, accely*10, 400);
  //g.colors(red, green, blue);
  //g.display(posz, 180, 400);
  //g.colors(red, green, blue);
  
  noStroke();
  fill(red, green, blue, 230);
  circle(circX, circY, diameter);
  println(circX);
  println(circY);
  //println("x: ", posx);
  //println("y: ", posy);
  ////lineX=circX;
  ////lineY=circY;
  //linePX=lineX-2;
  //linePY=lineY-2;
  //stroke(red, green, blue,10);
  //strokeWeight(3);
  //line(linePX, linePY, lineX, lineY);
  
  int dropLength = int(map(fsrSense, 0, 450, 0, 50));
  
  for(int i=0; i<dropLength; i++) {
  //int i = int(map(fsrSense, 0, 450, 0, 50));
  drops[i].display();
  drops[i].rainbow();
  println("i: ", i);
  }
  
  }
  
  if(button4 == 4) {
    println(4);
   
    background(0);
    
  }

}

public void posX(float numsX) {
  
  posx = numsX;
  
  circX = map(posx, 10, 300, 0, width);
  lineX = map(posx, 100, 350, 0, width);
 
  
}

public void posY(float numsY) {
  
  posy = numsY;
  
  if(posy < 10) {
    //add something here
  }
  
  circY = map(posy, -50, 50, 0, height);
  lineY = map(posy, -40, 40, 0, height);
  
}

public void posZ(float numsZ) {

  posz = numsZ;
  diameter = int(map(posz, -100, 100, 10, 50));
}

public void accelX(float accelX) {

  accelx = accelX;
  
}

public void accelY(float accelY) {

  accely = accelY;
}

public void accelZ(float accelZ) {
  
  accelz = accelZ;
  
}

public void slider(int slider) {
  
  sliderPot = slider;
  
  //println("slider: ", sliderPot);
  
  if(sliderPot < 400) {
    
  red = map(sliderPot, 0, 400, 0, 255);
    
    //println("red: ", red);
  }
  else if(sliderPot < 800) {
    
  green = map(sliderPot, 400, 800, 0, 255);
    
    //println("green: ", green);
  } else {
    blue = map(sliderPot, 800, 1000, 0, 255);
    
    //println("blue: ", blue);
  }
  
}

  
 


public void fsr(int fsr) {

  fsrSense = fsr;
  
  diameter = int(map(fsrSense, 0, 400, 10, 50));
  
}

public void buttonTwo(int buttonTwo) {

  button2 = buttonTwo;

}

public void buttonThree(int buttonThree) {

  button3 = buttonThree;

}

public void buttonFour(int buttonFour) {

  button4 = buttonFour;

}
