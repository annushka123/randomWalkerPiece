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
    fill(255, 10);
    ellipse(x,y,16,16);
    
    
  }
  
}
