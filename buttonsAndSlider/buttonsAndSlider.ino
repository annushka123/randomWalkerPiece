/*
  DigitalReadSerial

  Reads a digital input on pin 2, prints the result to the Serial Monitor

  This example code is in the public domain.

  https://www.arduino.cc/en/Tutorial/BuiltInExamples/DigitalReadSerial
*/

// digital pin 2 has a pushbutton attached to it. Give it a name:
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


// the setup routine runs once when you press reset:
void setup() 
{
  // initialize serial communication at 9600 bits per second:
  Serial.begin(57600);
  // make the pushbutton's pin an input:
  pinMode(input2Pin, INPUT_PULLUP);
  pinMode(input3Pin, INPUT_PULLUP);
  pinMode(input4Pin, INPUT_PULLUP);
  
}

// the loop routine runs over and over again forever:
void loop() {
    float voltage = potVal * (3.3 / 1023.0);

  potVal = analogRead(potSlider);
  // potVal = map(potVal, 4, 1023, 8, 108);
  // Serial.println(potVal);
  delay(15);
  // byte buttonState = digitalRead(input2Pin);
  // int sensorValue = analoglRead(A6);

  // print out the state of the button:
  // Serial.println(digitalRead(input2Pin));
    // read the input on analog pin 0:
  // int input2Pin = digitalRead(2);
  // int input3Pin = digitalRead(3);
  // int sinput4Pin = digitalRead(4);

  buttonState2 = digitalRead(input2Pin);
  buttonState3 = digitalRead(input3Pin);
  buttonState4 = digitalRead(input4Pin);

   if (buttonState2 != lastButtonState2) {
    // check if the pushbutton is pressed. 

  

      if (buttonState2 == LOW) {
       Serial.println("2"); 
      }
      // } else {
      //   Serial.println("0");
      // }
    }

    lastButtonState2 = buttonState2;

  

    delay(10);

    //  //compare buttonSate to its previous state
  if (buttonState3 != lastButtonState3) {
    // check if the pushbutton is pressed. 
//Serial.println("1");
  

      if (buttonState3 == LOW) {
       Serial.println("3"); 
      }       
      // } else {
      //   Serial.println("2");
      // }
    }

    lastButtonState3 = buttonState3;

  

    delay(10);

    
    //  //compare buttonSate to its previous state
  if (buttonState4 != lastButtonState4) {
    // check if the pushbutton is pressed. 
//Serial.println("1");
  

      if (buttonState4 == LOW) {
       Serial.println("4"); 
      }
      // } else {
      //   Serial.println("4");
      // }
    }

    lastButtonState4 = buttonState4;

  

    delay(10);

    
//     //  //compare buttonSate to its previous state
//   if (buttonState5 != lastButtonState5) {
//     // check if the pushbutton is pressed. 
// //Serial.println("1");
  

//       if (buttonState5 == HIGH) {
//        Serial.println("7"); 
//       } else {
//         Serial.println("6");
//       }
//     }

//     lastButtonState5 = buttonState5;

  

//     delay(10);

  //  if (digitalRead(input2Pin) == 0) {

   
  //   Serial.println("1");
  // }  else if 
  // // int buttonState2 = digitalRead(input3Pin);
  //    (digitalRead(input3Pin) == 0) {

   
  //   Serial.println(input3Pin);
  // }  
  // else if
  // // int buttonState2 = digitalRead(input3Pin);
  //    (digitalRead(input4Pin) == 0) {

   
  //   Serial.println("3");
  // }
    
  // //   Serial.println("button is not pressed");
  // // }
  // // // print out the state of the button:
  // // Serial.println(buttonState2);
  // delay(100);  // delay in between reads for stability
}
