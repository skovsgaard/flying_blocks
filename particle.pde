class Particle {
  // Variables for position, velocity, color and gravity
  float posX = 0;
  float posY = 0;

  float velocityX = 0;
  float velocityY = 0;

  color particleClr = color(240);

  float gravity = 0.3;

  // Construct a Particle with a given position, xy, and a velocity on both axes
  Particle(float x, float y, float sX, float sY) {
    posX = x;
    posY = y;

    velocityX = sX;
    velocityY = sY;
  }

  // Create an ellipse to represent the particle.
  void display() {
    int pDiameter = 3;
    stroke(particleClr);
    ellipse(posX, posY, pDiameter, pDiameter);
  }

  // Increase x and y positions to move the particle, then apply gravity
  void move() {
    posX += velocityX;
    posY += velocityY;

    velocityY += gravity;
  }
}
