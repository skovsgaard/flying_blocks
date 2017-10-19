class Obstacle {
  // Variables for speed, position, and whether the obstacle is off screen
  int moveSpeed = 4;

  int x;
  int y;
  int w;
  int h;

  boolean hasLeft = false;

  // Obstacles get constructed with its position as arguments and a fixed size
  Obstacle(int freshX, int freshY) {
    x = freshX;
    y = freshY;

    w = 50;
    h = 50;
  }

  // Draw the obstacle
  void draw() {
    rect(x, y, w, h);
  }

  void move(Score score) {
    if (x <= -50) {
      hasLeft = true;
    }

    // If the obstacle has left the screen, randomize
    // whether to increase the speed of the obstacle
    if (hasLeft) {
      float randPercentage = random(1);
      if (randPercentage > 0.8) { moveSpeed++; }
      wrapAround(score);
      hasLeft = false;
    } else {
      // If still on screen, move the obstacle
      x -= moveSpeed;
    }
  }

  // Move the obstacle to just outside the right border of the screen,
  // then randomize the y position of the obstacle as it's ready to reenter the
  // screen, then update the score
  void wrapAround(Score score) {
    x = 900;
    y = int(random(100, 350));
    score.update();
  }
}
