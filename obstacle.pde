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

  void move(Score score) {
    if (x <= -50) {
      hasLeft = true;
    }
    
    if (hasLeft) {
      float randPercentage = random(1);
      if (randPercentage > 0.8) { moveSpeed++; }
      wrapAround(score);
      hasLeft = false;
    } else {
      x -= moveSpeed;
    }
  }

  void wrapAround(Score score) {
    x = 900;
    y = int(random(100, 350));
    score.update();
  }
}
