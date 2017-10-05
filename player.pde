class Player {
  float x = 50.0, y = 350.0;
  boolean isUp = false;
  boolean isJumping = false;
  int dodgeLength = 100;

  float jumpPower = -10.0;
  float jumpSpeed = -10.0;
  float gravity = 0.5;
  
  int h = 50, w = 50;
  color clr = color(240);
  
  void draw() {
    fill(clr);
    rect(x, y, h, w);
  }

  void update(BasePlatform platform) {
    if (isJumping) {
      y += jumpSpeed;
      jumpSpeed += gravity;

      if ((y + h) >= platform.y) {
        println(platform.y);
        jumpSpeed = jumpPower;
        isJumping = false;
      }
    }
  }
  
  void setJumping(boolean value) {
    isJumping = value;
  }

  boolean collidingWith(Obstacle o) {
    return x + w >= o.x && y >= o.y;
  }
}
