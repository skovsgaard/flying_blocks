class Obstacle {
  int moveSpeed = 4;

  int x;
  int y;
  int w;
  int h;

  boolean hasLeft = false;
  
  Obstacle(int freshX, int freshY) {
    x = freshX;
    y = freshY;

    w = 50;
    h = 50;
  }

  void draw() {
    rect(x, y, w, h);
  }

  void move() {
    if (x <= -50) {
      hasLeft = true;
    }
    
    if (hasLeft) {
      float randPercentage = random(1);
      if (randPercentage > 0.8) { moveSpeed++; }
      wrapAround();
      hasLeft = false;
    } else {
      x -= moveSpeed;
    }
  }

  void wrapAround() {
    x = 900;
    y = int(random(100, 350));
  }
}
