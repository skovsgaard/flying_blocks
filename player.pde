class Player {
  float x = 50.0, y = 400.0;
  boolean isUp = false;
  int dodgeLength = 100;
  
  int h = 50, w = 50;
  color clr = color(240);
  
  void draw() {
    fill(clr);
    rect(x, y - h, h, w);
  }

  void dodge() {
    if (isUp) {
      y += dodgeLength;
      isUp = false;
    } else {
      y -= dodgeLength;
      isUp = true;
    }
  }

  boolean collidingWith(Obstacle o) {
    return x + w >= o.x && y >= o.y;
  }
}
