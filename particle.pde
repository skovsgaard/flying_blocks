class Particle {
  float posX = 0;
  float posY = 0;

  float velocityX = 0;
  float velocityY = 0;

  color c = color(int(random(128, 256)),
                  int(random(128, 256)),
                  int(random(128, 256)));

  float gravity = 0.3;

  Particle(float x, float y, float sX, float sY) {
    posX = x;
    posY = y;

    velocityX = sX;
    velocityY = sY;
  }

  void display() {
    stroke(c);
    point(posX, posY);
    println("display() was called");
  }

  void move() {
    posX += velocityX;
    posY += velocityY;

    velocityY += gravity;
  }
}
