
  
  
  float speedX = 0.5;
  float speedY = 1;
  float headX = 0;
  float headX2 = headX-40;
  float headX3 = headX + 40;
  float headY = 0;
  float headY2 = headY-22;
  float rightY = headY-8;
  
  float y = 270;


void setup() {
 size (400, 400);
 
  
}

void draw() {
  
  background(255);
  strokeWeight(2);
  
  noFill();

  pushMatrix();
  translate(width/2, height/2);
  

  
  bezier(headX, headY, headX, headY2, headX2, headY2, headX2, rightY);
  bezier(headX, headY, headX, headY2, headX3, headY2, headX3, rightY);
  
  rightY = rightY+speedX;
  //rightY++;
  
  //leftY++;
  
  if (rightY > 3 || rightY < -10 ) {
   println(rightY);
    speedX = speedX*-1;
  }

  
  popMatrix();
  
}
