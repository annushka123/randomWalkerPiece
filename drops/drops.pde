Drop[] drops = new Drop[50];
void setup() {
size(400,400);
smooth();
// Initialize all drops
for (int i = 0; i < drops.length; i ++ ) {
drops[i] = new Drop();
}
}
void draw() {
background(255);
// Move and display all drops
for (int i = 0; i < drops.length; i ++ ) {
//drops[i].move();
drops[i].display();
}
}

class Drop {
float x,y; // Variables for location of raindrop
float speed; // Speed of raindrop
color c;
float r; // Radius of raindrop
Drop() {
r = 8; // All raindrops are the same size
x = random(width); // Start with a random x location
y = -r*4; // Start a little above the window
speed = random(1,5); // Pick a random speed
c = color(50,100,150); // Color
}
//Move the raindrop down
void move() {
y += speed; // Increment by speed
}
// Check if it hits the bottom
boolean reachedBottom() {
// If we go a little past the bottom
if (y > height + r*4) {
return true;
} else {
return false;
}
}
// Display the raindrop
void display() {
// Display the drop
fill(50,100,150);
noStroke();
ellipse(x,y,r*2,r*2);
}
}
