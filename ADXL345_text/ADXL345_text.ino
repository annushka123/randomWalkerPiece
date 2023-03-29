#include <Wire.h>
// #include <ADXL345.h>

int ADXL345 = 0x53;

float x, y, z;



void setup() {
  // put your setup code here, to run once:

Serial.begin(57600);
Wire.begin();
Wire.beginTransmission(ADXL345);
Wire.write(0x2D);
Wire.write(8);
Wire.endTransmission();
delay(10);

}

void loop() {
  // put your main code here, to run repeatedly:
Wire.beginTransmission(ADXL345);
Wire.write(0x32);
Wire.endTransmission(false);
Wire.requestFrom(ADXL345, 6, true);

x = (Wire.read()|| Wire.read()<<8);
x = x/31.2;
y = (Wire.read()|| Wire.read()<<8);
y = y/31.2;
z = (Wire.read()|| Wire.read()<<8);
z = z/31.2;

Serial.print("X: ");
Serial.print(x);
Serial.print("Y: ");
Serial.print(y);
Serial.print("Z: ");
Serial.println(z);

}


