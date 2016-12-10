// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// A simple Particle class
class Particle {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  Particle(float posX, float posY) {
    x = posX;
    y = posY;
    //x = mouseX;
    //y = mouseY;
    xspeed = random(-1,1);
    yspeed = random(-2,0);
  }
  
  void run() {
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void gravity() {
    yspeed += 0.1;
  }
  
  void display() {
    stroke(0);
    //fill(0,75);
    fill(random(255), random(255), random(255), 90);
    ellipse(x,y,20,20);
  }
}