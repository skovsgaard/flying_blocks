/*
  Title: "Not quite FlappyBird"
  Description: A quick little game of jumping.
  By Jonas Skovsgaard Christensen, 5 October 2017
  Comments: Press SHIFT to jump.
*/

BasePlatform platform = new BasePlatform();
Player player = new Player();
Obstacle obstacle;
Score score = new Score();

void setup() {
  size(900, 500);
  noStroke();
  obstacle = new Obstacle(width, platform.y-50);
}

void draw() {
  background(25, 25, 140);

  if (!player.collidingWith(obstacle)) {
    platform.draw();
    player.update(platform);
    player.draw();
    
    obstacle.move();
    obstacle.draw();

    if (player.passed(obstacle)) { score.update();}
    score.draw();
  } else {
    clear();
    text("You lost the game", 10, 10);
    text("You had " + score.numJumps + " successful jumps.", 10, 30);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      player.setJumping(true);
    }
  }
}
