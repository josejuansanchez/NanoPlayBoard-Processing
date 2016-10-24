import processing.serial.*;

Serial myPort;
float value;

void setup() {
  setSerial();
  size(300,300);
}

void draw() {
  readFromSerial();
  background(255);
  ellipse(width/2, height/2, value, value);
}

void setSerial() {
  for(int i = 0; i < Serial.list().length; i++) {
    println("i: " + i + " - " + Serial.list()[i]);
  }
  String portName = Serial.list()[7];
  myPort = new Serial(this, portName, 57600);
}

void readFromSerial() {
  if (myPort.available() <= 0) return;
  String serial_value = myPort.readStringUntil('\n'); 
  if (serial_value == null) return;
  value = float(trim(serial_value)); 
}