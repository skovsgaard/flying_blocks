class Obstacle {
  int moveSpeed = 2;

  int x;
  int y;

  boolean hasLeft = false;
  
  Obstacle(int freshX, int freshY) {
    x = freshX;
    y = freshY;
  }

  void draw() {
    rect(x, y, 50, 50);
  }

  void move() {
    if (x <= -50) {
      hasLeft = true;
    }
    
    if (hasLeft) {
      wrapAround();
      hasLeft = false;
    } else {
      x -= moveSpeed;
    }
  }

  void wrapAround() {
    x = 900;
  }
}
