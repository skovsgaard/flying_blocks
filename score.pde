class Score {
  // Variable to hold the number of succesfully passed obstacles
  int numJumps = 0;

  // Getter method for numJumps
  int get() {
    return numJumps;
  }

  // Write the score to the top right of the screen
  void draw() {
    text(numJumps, width-50, 50);
  }

  // Incrementor for numJumps
  void update() {
    numJumps++;
  }

  // Used at game over to reset the score
  void reset() {
    numJumps = 0;
  }
}
