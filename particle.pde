class Particle {
  float posX = 0;
  float posY = 0;

  float velocityX = 0;
  float velocityY = 0;

  color particleClr = color(240);

  float gravity = 0.3;

  Particle(float x, float y, float sX, float sY) {
    posX = x;
    posY = y;

    velocityX = sX;
    velocityY = sY;
  }

  void display() {
    int pDiameter = 3;
    stroke(particleClr);
    ellipse(posX, posY, pDiameter, pDiameter);
  }

  void move() {
    posX += velocityX;
    posY += velocityY;

    velocityY += gravity;
  }
}
