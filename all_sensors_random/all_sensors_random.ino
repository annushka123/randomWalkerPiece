/*****************************************************************************/
//	Function:    Get the accelemeter of X/Y/Z axis and print out on the
//					serial monitor.
//  Hardware:    3-Axis Digital Accelerometer(��16g)
//	Arduino IDE: Arduino-1.0
//	Author:	 Frankie.Chu
//	Date: 	 Jan 11,2013
//	Version: v1.0
//	by www.seeedstudio.com
//
//  This library is free software; you can redistribute it and/or
//  modify it under the terms of the GNU Lesser General Public
//  License as published by the Free Software Foundation; either
//  version 2.1 of the License, or (at your option) any later version.
//
//  This library is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//  Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public
//  License along with this library; if not, write to the Free Software
//  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
//
/*******************************************************************************/

#include <Wire.h>
#include <ADXL345.h>

#define FORCE_SENSOR_PIN A0


ADXL345 adxl; //variable adxl is an instance of the ADXL345 library

int const potSlider = A7;
int potVal;


const int input2Pin = 2;
const int input3Pin = 3;
const int input4Pin = 4;

int buttonState2 = 0;
int lastButtonState2 = 0;

int buttonState3 = 0;
int lastButtonState3 = 0;

int buttonState4 = 0;
int lastButtonState4 = 0;


void setup() {
    Serial.begin(57600);
    adxl.powerOn();

    //set activity/ inactivity thresholds (0-255)
    adxl.setActivityThreshold(75); //62.5mg per increment
    adxl.setInactivityThreshold(75); //62.5mg per increment
    adxl.setTimeInactivity(10); // how many seconds of no activity is inactive?

    //look of activity movement on this axes - 1 == on; 0 == off
    adxl.setActivityX(1);
    adxl.setActivityY(1);
    adxl.setActivityZ(1);

    //look of inactivity movement on this axes - 1 == on; 0 == off
    adxl.setInactivityX(1);
    adxl.setInactivityY(1);
    adxl.setInactivityZ(1);

    //look of tap movement on this axes - 1 == on; 0 == off
    adxl.setTapDetectionOnX(0);
    adxl.setTapDetectionOnY(0);
    adxl.setTapDetectionOnZ(1);

    //set values for what is a tap, and what is a double tap (0-255)
    adxl.setTapThreshold(50); //62.5mg per increment
    adxl.setTapDuration(15); //625us per increment
    adxl.setDoubleTapLatency(80); //1.25ms per increment
    adxl.setDoubleTapWindow(200); //1.25ms per increment

    //set values for what is considered freefall (0-255)
    adxl.setFreeFallThreshold(7); //(5 - 9) recommended - 62.5mg per increment
    adxl.setFreeFallDuration(45); //(20 - 70) recommended - 5ms per increment

    //setting all interrupts to take place on int pin 1
    //I had issues with int pin 2, was unable to reset it
    adxl.setInterruptMapping(ADXL345_INT_SINGLE_TAP_BIT,   ADXL345_INT1_PIN);
    adxl.setInterruptMapping(ADXL345_INT_DOUBLE_TAP_BIT,   ADXL345_INT1_PIN);
    adxl.setInterruptMapping(ADXL345_INT_FREE_FALL_BIT,    ADXL345_INT1_PIN);
    adxl.setInterruptMapping(ADXL345_INT_ACTIVITY_BIT,     ADXL345_INT1_PIN);
    adxl.setInterruptMapping(ADXL345_INT_INACTIVITY_BIT,   ADXL345_INT1_PIN);

    //register interrupt actions - 1 == on; 0 == off
    adxl.setInterrupt(ADXL345_INT_SINGLE_TAP_BIT, 1);
    adxl.setInterrupt(ADXL345_INT_DOUBLE_TAP_BIT, 1);
    adxl.setInterrupt(ADXL345_INT_FREE_FALL_BIT,  1);
    adxl.setInterrupt(ADXL345_INT_ACTIVITY_BIT,   1);
    adxl.setInterrupt(ADXL345_INT_INACTIVITY_BIT, 1);

    pinMode(input2Pin, INPUT_PULLUP);
    pinMode(input3Pin, INPUT_PULLUP);
    pinMode(input4Pin, INPUT_PULLUP);
}

void loop() {

    //Boring accelerometer stuff
    int x, y, z;
    adxl.readXYZ(&x, &y, &z); //read the accelerometer values and store them in variables  x,y,z



  // Serial.println("");

    double xyz[3];
    double ax, ay, az;
    adxl.getAcceleration(xyz);
    ax = xyz[0];
    ay = xyz[1];
    az = xyz[2];

  Serial.print("x ");
  Serial.print(x );
  Serial.print(" y ");
  Serial.print(y );
  Serial.print(" z ");
  Serial.print(z );
  Serial.print(" xg ");
  Serial.print(ax );
  Serial.print(" yg ");
  Serial.print(ay );
  Serial.print(" zg ");
  Serial.print(az );
  Serial.println("");
  delay(500);


//slider code
  float voltage = potVal * (3.3 / 1023.0);
  potVal = analogRead(potSlider);
  Serial.print("slider ");
  Serial.print(potVal);
  Serial.println("");
  delay(15);

  buttonState2 = digitalRead(input2Pin);
  buttonState3 = digitalRead(input3Pin);
  buttonState4 = digitalRead(input4Pin);

   if (buttonState2 != lastButtonState2) {
    // check if the pushbutton is pressed. 

      if (buttonState2 == LOW) {
       Serial.print("button_two ");
       Serial.print("2 "); 
       Serial.println("");

      }

    }

    lastButtonState2 = buttonState2;

    delay(10);

    //  //compare buttonSate to its previous state
  if (buttonState3 != lastButtonState3) {
    // check if the pushbutton is pressed. 

      if (buttonState3 == LOW) {
       Serial.print("button_three ");
       Serial.print("3 "); 
       Serial.println(""); 
      }       
  
    }

    lastButtonState3 = buttonState3;

    delay(10);

    
    //  //compare buttonSate to its previous state
  if (buttonState4 != lastButtonState4) {
    // check if the pushbutton is pressed. 

      if (buttonState4 == LOW) {
       Serial.print("button_four ");
       Serial.print("4 "); 
       Serial.println("");
      }

    }

    lastButtonState4 = buttonState4;

    delay(10);

      int analogReading = analogRead(FORCE_SENSOR_PIN);

  Serial.print("Force sensor reading = ");
  Serial.print(analogReading); // print the raw analog reading

  if (analogReading < 10)       // from 0 to 9
    Serial.println(" -> no pressure");
  else if (analogReading < 200) // from 10 to 199
    Serial.println(" -> light touch");
  else if (analogReading < 500) // from 200 to 499
    Serial.println(" -> light squeeze");
  else if (analogReading < 800) // from 500 to 799
    Serial.println(" -> medium squeeze");
  else // from 800 to 1023
    Serial.println(" -> big squeeze");

  delay(1000);

}
