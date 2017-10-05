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
