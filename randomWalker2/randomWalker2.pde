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

float[] xValues;
float[] yValues;
int i = 0;

float linePX;
float linePY;
float lineX;
float lineY;

void setup(){
  size(800, 800, P3D);
  
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
  
  //noStroke();
  //fill(red, green, blue, 230);
  //circle(circX, circY, diameter);
  //println(circX);
  //println(circY);
  
  pushMatrix();
  translate(400, 400, 0);
  //rect(posx, posy, posx+100, posy+100);
  println("y", posy+100);
  println("x ", posx);
  rotateX(radians(posx));
  
  
  rotateY(radians(posy));
  
  stroke(255);
  noFill();
  
  box(posx, posy, posz);
  
  popMatrix();

  
  int dropLength = int(map(fsrSense, 0, 450, 0, 50));
  
  for(int i=0; i<dropLength; i++) {
  //int i = int(map(fsrSense, 0, 450, 0, 50));
  drops[i].display();
  drops[i].rainbow();
  println("i: ", i);
  }
  
  }
  
  else if(button4 == 4) {
    println(4);
   
    background(0);
    
  }

}

public void posX(float numsX) {
  
  posx = numsX;
  
  xValues[i] = posx;

  i++;
 
  
}

public void posY(float numsY) {
  
  posy = numsY;
  
  
  yValues[i] = posy;
  i--;
  
  
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
