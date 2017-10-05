/*
  Title: "Not quite FlappyBird"
  Description: A quick little game of jumping.
  By Jonas Skovsgaard Christensen, 5 October 2017
  Comments: Press SHIFT to jump.
*/

BasePlatform platform = new BasePlatform();
Player player = new Player();
Obstacle obstacle;

void setup() {
  size(900, 500);
  noStroke();
  obstacle = new Obstacle(height - 50, platform.y-50);
}

void draw() {
  background(25, 25, 140);

  if (!player.collidingWith(obstacle)) {
    platform.draw();
    player.update(platform);
    player.draw();
    
    obstacle.move();
    obstacle.draw();
  } else {
    clear();
    text("You lost the game", 10, 10);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      player.setJumping(true);
    }
  }
}
