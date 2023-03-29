// Declare global variables
float x_pos = 0;        // Current x position
float x_vel = 1;        // Velocity in x direction
float prev_x_pos = 0; 
float y_pos = 10;
float prev_y_pos;// Previous x position (initialized to 0)

void setup() {
  size(640, 480);
}

void draw() {
  background(255);  // Clear the canvas
  updatePosition(); // Update x position and velocity
  drawObject();     // Draw the object at its current position
}

void updatePosition() {
  // Calculate the new x position based on the velocity
  x_pos += x_vel;
  
  // Update the previous x position to be the current x position before the update
  prev_x_pos = x_pos - x_vel;
  
  y_pos+=x_vel;
  
  prev_y_pos=y_pos-x_vel;
}

void drawObject() {
  fill(0);           // Set fill color to black
  line(x_pos+10, y_pos, prev_x_pos-random(5), prev_y_pos);  // Draw a circle at the current x position
  fill(255, 0, 0);   // Set fill color to red
  //line(prev_x_pos, 240, prev_x_pos+10, 50); // Draw a circle at the previous x position
}
