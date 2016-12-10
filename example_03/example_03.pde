// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

import processing.serial.*;

Serial port;
float posX = width/2;
float posY = 270;
ArrayList<Particle> particles;

void setup() {
  setSerial();  
  size(540, 540);
  particles = new ArrayList<Particle>();
}

void draw() {
  // A new Particle object is added to the ArrayList every cycle through draw().
  particles.add(new Particle(posX, posY)); 

  background(255);
  // Iterate through our ArrayList and get each Particle
  // The ArrayList keeps track of the total number of particles.
  for (Particle p : particles) { 
    p.run();
    p.gravity();
    p.display();
  }

  // If the ArrayList has more than 100 elements in it, we delete the first element, using remove().
  if (particles.size() > 100) {
    particles.remove(0);
  }
}

void setSerial() {
  // In case you want to see the list of available ports
  println(Serial.list());

  // Using the first available port (might be different on your computer)
  port = new Serial(this, Serial.list()[5], 57600);
}

// Called whenever there is something available to read
void serialEvent(Serial port) {
  String serial_value = port.readStringUntil('\n');
  if (serial_value == null) return;
  posX = float(serial_value);
}