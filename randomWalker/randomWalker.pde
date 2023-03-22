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

float red;
float green;
float blue;

int diameter;
float circX;
float circY;

void setup(){
  size(800, 800);
  
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
  
  
  
  generator = new java.util.Random();
  g = new GassE();
  //s = new Slider();
  //background(0);
  noStroke();
  
}

void draw(){
 
  if(button2 == 2) {
  
  //g.display(posx, accelx, accely); 
  //g.colors(100, green, blue);
  //println("red", red);
  //g.display(posy, accely*10, 400);
  //g.colors(red, green, blue);
  //g.display(posz, 180, 400);
  //g.colors(red, green, blue);
  print(2);
 
  fill(red, green, blue, 10);
  circle(circX, circY, diameter);
  println("x: ", posx);
  println("y: ", posy);
  
  
  }
  
  else if(button4 == 4) {
   
    background(0);
    
  }

}

public void posX(float numsX) {
  
  posx = numsX;
  
  circX = map(posx, 190, 300, 0, width);
 
  
}

public void posY(float numsY) {
  
  posy = numsY;
  
  circY = map(posy, -50, 50, 0, height);

  
}

public void posZ(float numsZ) {

  posz = numsZ;
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
