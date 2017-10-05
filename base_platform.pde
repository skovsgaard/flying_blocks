class BasePlatform {
  int x = 0,
    y = 400;
  
  void draw() {
    fill(240);
    rect(x, y, width, height);
  }
}
