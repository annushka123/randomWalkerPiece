import oscP5.*;
import netP5.*;

OscP5 oscP5;
int x;
int y;
int z;
void setup(){
  size(400, 400);
  
  oscP5 = new OscP5(this, 6002);
  oscP5.plug(this, "accelX", "/numsX");
  oscP5.plug(this, "accelY", "/numsY");
  oscP5.plug(this, "accelZ", "/numsZ");
  
  
}

void draw(){
 
  background(255);
  noFill();
  strokeWeight(2);
  rect(x+100, y*1.5, y*2.8, z*20);
}

public void accelX(int numsX) {
  x = numsX;
  println(numsX);
  
}

public void accelY(int numsY) {
  y = numsY;
  println(numsY);
  
}

public void accelZ(int numsZ) {
  z = numsZ;
  println(numsZ);
  
}
