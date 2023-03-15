import oscP5.*;
import netP5.*;

java.util.Random generator;

GassE g;

OscP5 oscP5;

float posx;
float posy;
float posz;
float accelx;
float accely;
float accelz;

void setup(){
  size(800, 800);
  
  oscP5 = new OscP5(this, 6002);
  oscP5.plug(this, "posX", "/numsX");
  oscP5.plug(this, "posY", "/numsY");
  oscP5.plug(this, "posZ", "/numsZ");
  oscP5.plug(this, "accelX", "/accelX");
  oscP5.plug(this, "accelY", "/accelY");
  oscP5.plug(this, "accelZ", "/accelZ");
  
  generator = new java.util.Random();
  g = new GassE();
  background(0);
  
}

void draw(){
 
  
  g.display(posx*3, 30, accelx*100); 
  g.display(posy*-1.5, accely*10, 400);
  
  
  g.display(posz*-1, 180, accelz*-400);
  println(accelz*-400);
  

}

public void posX(float numsX) {
  
  posx = numsX;
 
  
}

public void posY(float numsY) {
  
  posy = numsY;

  
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
