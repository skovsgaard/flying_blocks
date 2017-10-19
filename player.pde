class Player {
  // Initialize a fixed starting position and
  // a variable to hold jumping state
  float x = 50.0, y = 350.0;
  boolean isJumping = false;

  // Set the force with which the player can jump,
  // the velocity of the jump, and the gravity
  float jumpPower = -15.0;
  float velocity = -15.0;
  float gravity = 0.5;

  // Set height and width. Used exclusively to calculate collision
  int h = 50, w = 50;

  // Display the animation at the player's x,y
  void draw(Animation animation) {
    animation.display(x, y);
  }

  // Identify whether the player is jumping,
  // and if so whether the player has landed on the BasePlatform again
  void update(BasePlatform platform) {
    if (isJumping) {
      y += velocity;
      velocity += gravity;

      if ((y + h) >= platform.y) {
        velocity = jumpPower;
        isJumping = false;
      }
    }
  }

  // Setter for isJumping
  void setJumping(boolean value) {
    isJumping = value;
  }

  // Check whether the player is colliding with an obstacle
  boolean collidingWith(Obstacle o) {
    return
      x + w >= o.x &&
      y <= o.y + o.h &&
      y >= o.y;
  }
}
