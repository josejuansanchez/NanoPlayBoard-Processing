#include <NanoPlayBoard.h>

NanoPlayBoard board;

void setup() {
  Serial.begin(57600);
}

void loop() {
  int value = board.potentiometer.scaleTo(0, 255);
  Serial.println(value);
  delay(20);
}
