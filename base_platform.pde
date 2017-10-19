class BasePlatform {
  // Variables for position of the platform
  int x = 0, y = 400;

  // Draw the platform
  void draw() {
    fill(240);
    rect(x, y, width, height);
  }
}
