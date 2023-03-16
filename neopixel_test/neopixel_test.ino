#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
 #include <avr/power.h> // Required for 16 MHz Adafruit Trinket
#endif

// Which pin on the Arduino is connected to the NeoPixels?
// On a Trinket or Gemma we suggest changing this to 1:
#define LED_PIN    6

// How many NeoPixels are attached to the Arduino?
#define LED_COUNT 2

// Declare our NeoPixel strip object:
Adafruit_NeoPixel strip(LED_COUNT, LED_PIN, NEO_GRB + NEO_KHZ800);


int inByte = 0;
char buffer[40];
int index = 0;
int value = 0;



void setup() {
  // put your setup code here, to run once:
  Serial.begin(57600);

  #if defined(__AVR_ATtiny85__) && (F_CPU == 16000000)
  clock_prescale_set(clock_div_1);
#endif

  strip.begin();           // INITIALIZE NeoPixel strip object (REQUIRED)
  strip.show();            // Turn OFF all pixels ASAP
  strip.setBrightness(50); // Set BRIGHTNESS to about 1/5 (max = 255)

}

void loop() {
  // put your main code here, to run repeatedly:
  index = 0;
  do
  {
    buffer[index] = Serial.read();
    if(buffer[index]!=-1) index = index+1;

  } while(buffer[index-1]!=32);

  value = atoi(buffer);
  

  delay(5);

}
