class Score {
  int numJumps = 0;

  void draw() {
    text(numJumps, width-50, 50);
  }

  void update() {
    numJumps++;
  }

  void reset() {
    numJumps = 0;
  }
}
