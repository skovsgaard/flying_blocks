/*
  Title: "Not quite FlappyBird"
  Description: A quick little game of jumping.
  By Jonas Skovsgaard Christensen, 5 October 2017
  Comments: Press UP to jump and SHIFT to restart the game when dead.
*/

BasePlatform platform = new BasePlatform();
Player player = new Player();
Obstacle obstacle;
Score score = new Score();
Particle[] particles = new Particle[200];

void setup() {
  size(900, 500);
  noStroke();
  obstacle = new Obstacle(width, platform.y-50);

  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(player.x, player.y, random(-3,3), random(-6,0));
  }
}

void draw() {
  background(25, 25, 140);

  platform.draw();
  obstacle.draw(int(random(platform.y-50, platform.y-200)));
  
  if (!player.collidingWith(obstacle)) {
    player.update(platform);
    player.draw();
    
    obstacle.move();

    if (player.passed(obstacle)) { score.update();}
    score.draw();
  } else {
    for (int i = 0; i < particles.length; i++) {
      particles[i].move();
      particles[i].display();
    }
    text("You lost the game", 20, 20);
    text("You had " + score.numJumps + " successful jumps.", 20, 40);

    if (keyPressed) {
      if (keyCode == SHIFT) { setup(); }
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      player.setJumping(true);
    }
  }
}
