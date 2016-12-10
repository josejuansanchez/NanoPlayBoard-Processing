#include <NanoPlayBoard.h>

NanoPlayBoard board;

void setup() {
  Serial.begin(57600);
}

void loop() {
  int value = board.ldr.scaleTo(0, 540);
  Serial.println(value);
  delay(20);
}
