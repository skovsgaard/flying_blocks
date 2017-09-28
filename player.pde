class Player {
  float x = 50.0,
    y = 400.0,
    speed = 300.0,
    easing = 0.02,
    jumpHeight = 50,
    fallSpeed = 5;
  int h = 50, w = 50;
  color clr = color(240);
  
  void draw() {
    fill(clr);
    rect(x, y - h, h, w);
  } 

  void jump(int basePlaneY) {
    y -= jumpHeight;

    while (y + h != basePlaneY) {
      y += fallSpeed;
    }
  }
  
  void move(int direction) {
    float targetX;
    
    if (direction > 0) {
      targetX = x + speed;
    } else {
      targetX = x - speed;
    }
    
    float dx = targetX - x;
    x += dx * easing;
    
    draw();
  }
}
