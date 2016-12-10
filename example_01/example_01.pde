import processing.serial.*;

Serial port;
float value;

void setup() {
  setSerial();
  size(300,300);
}

void draw() {
  background(255);
  ellipse(width/2, height/2, value, value);
}

void setSerial() {
  for(int i = 0; i < Serial.list().length; i++) {
    println("i: " + i + " - " + Serial.list()[i]);
  }
  String portName = Serial.list()[5];
  port = new Serial(this, portName, 57600);
}

void serialEvent(Serial port) {
  String serial_value = port.readStringUntil('\n');
  if (serial_value == null) return;
  value = float(serial_value);
}