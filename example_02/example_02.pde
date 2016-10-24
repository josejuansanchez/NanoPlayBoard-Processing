// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

import processing.serial.*;

Serial port;
float value = 0;

void setup() {
  size(200, 200);

  // In case you want to see the list of available ports
  // println(Serial.list());

  // Using the first available port (might be different on your computer)
  port = new Serial(this, Serial.list()[7], 57600);
}

void draw() {
  // The serial data is used to color the background.   
  background(value);
}

// Called whenever there is something available to read
void serialEvent(Serial port) {
  String serial_value = port.readStringUntil('\n');
  if (serial_value == null) return;
  value = float(serial_value);
}