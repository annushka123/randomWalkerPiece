java.util.Random generator;

GassE g;
 
void setup() {
  size(640,360);
  generator = new java.util.Random();
  g = new GassE();
  
  
}

void draw() {
  
  g.display(height/2, 60, 360 );
  g.display(100, 300, 10);
  //float num = (float) generator.nextGaussian();
  //float sd = 10;
  //float mean = 30;
 
//Multiply by the standard deviation and add the mean.
  //float x = sd * num + mean;
 
  //noStroke();
  //fill(255,10);
  //ellipse(x,height/2,16,16);
  //ellipse(x, 100, 16, 16);
}

class GassE {
  
  float num;
  float x,y;
  float sd;
  float mean;
  
  GassE() {
    

    
  }
  
  void display(float temp_y, float temp_sd, float temp_mean) {
    
    
    num = (float) generator.nextGaussian();
    sd = temp_sd;
    mean = temp_mean;
  
    x = sd*num+mean;
    y = temp_y;
    noStroke();
    fill(255,10);
    ellipse(x,y,16,16);
    
    
  }
  
}
