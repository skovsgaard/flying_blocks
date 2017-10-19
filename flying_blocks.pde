/*
  Title: "Flying Blocks"
  Description: A little game of jumping.
  By Jonas Skovsgaard Christensen, 5 October 2017
  Comments: Press UP to jump and SHIFT to restart the game when dead.
*/

// Declare and/or initialize the required objects for the game
BasePlatform platform = new BasePlatform();
Player player = new Player();
Obstacle obstacle;
Score score = new Score();
Particle[] particles = new Particle[200];

Animation animation;

HighScore hs = new HighScore();

// Initialize variables needed at the game over screen
boolean gameOver = false;
String hsName = "";

void setup() {
  size(900, 500);
  noStroke();
  // obstacle can be initialized from setup() at earliest as its constructor
  // needs access to width
  obstacle = new Obstacle(width, platform.y-50);

  // animation needs to be able to load images and therefore needs to
  // be initialized from within setup()
  animation = new Animation("coyote", 10);

  // Populate the array of particles required for the player sprite to explode
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(player.x, player.y, random(-3,3), random(-6,0));
  }
}

void draw() {
  background(25, 25, 140);

  // Platforms and Obstacles need to be drawn continuously throughout the game
  platform.draw();
  obstacle.draw();

  // Identify whether the player is still alive, i.e. not colliding with an obstacle
  if (!player.collidingWith(obstacle)) {
    // Only draw the player sprite when the player is alive
    player.update(platform);
    player.draw(animation);

    // The obstacle needs the score object as argument in order to
    // properly wrap around and re-enter the screen
    obstacle.move(score);

    score.draw();
  } else {
    // If the player is colliding with an obstacle, it means game over.
    // Start with the explosion effect using the particles array.
    for (int i = 0; i < particles.length; i++) {
      particles[i].move();
      particles[i].display();
    }
    gameOver = true;

    // Inform the player that the game is over and what their score is
    text("You lost the game", 20, 20);
    text("You successfully passed " + score.get() + " obstacles.", 20, 40);
    // Take a name entry and display it as it's being typed
    text("Please enter your name:", 20, 60);
    text(hsName, 20, 80);

    // Counter used to space the lines when printing the high score
    int offsetCounter = 20;

    text("HighScore:", width-180, offsetCounter);

    // Print the individual high score entries
    for (Map.Entry entry : hs.getScoreTable().entrySet()) {
      offsetCounter += 20;
      text(entry.getKey() + ": " + entry.getValue(), width-180, offsetCounter);
    }
  }
}

// Take exactly one key input as controls: UP for jumping
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      player.setJumping(true);
    }
  }
}

// Use keyReleased() instead of keyPressed() to avoid duplicate letters
// when the player is entering their name on the high score
void keyReleased() {
  if (gameOver) {
    // Save the name and score in the hs object's HashMap, when ENTER is pressed
    if (keyCode == RETURN || keyCode == ENTER) {
      hs.save(hsName,score.get());
      gameOver = false;
      score.reset();
      setup();
    } else if (keyCode == BACKSPACE) { // Allow erasing characters
      if (hsName.length() > 0) {
        hsName = hsName.substring(0, hsName.length()-1);
      }
    } else if (keyCode == DELETE) { // Use DELETE to remove the whole entry
      hsName = "";
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      // Any key not covered above will be added as a string to hsName
      hsName = hsName + key;
    }
  }
}
