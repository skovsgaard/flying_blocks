/*
  Title: "Flying Blocks"
  Description: A little game of jumping.
  By Jonas Skovsgaard Christensen, 5 October 2017
  Comments: Press UP to jump and SHIFT to restart the game when dead.
*/

BasePlatform platform = new BasePlatform();
Player player = new Player();
Obstacle obstacle;
Score score = new Score();
Particle[] particles = new Particle[200];

Animation animation;

void setup() {
  size(900, 500);
  noStroke();
  obstacle = new Obstacle(width, platform.y-50);

  animation = new Animation("coyote", 10);
  
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(player.x, player.y, random(-3,3), random(-6,0));
  }
}

void draw() {
  background(25, 25, 140);

  platform.draw();
  obstacle.draw();
  
  if (!player.collidingWith(obstacle)) {
    player.update(platform);
    player.draw(animation);
    
    obstacle.move(score);

    score.draw();
  } else {
    for (int i = 0; i < particles.length; i++) {
      particles[i].move();
      particles[i].display();
    }
    text("You lost the game", 20, 20);
    text("You successfully passed " + score.get() + " obstacles.", 20, 40);

    if (keyPressed) {
      if (keyCode == SHIFT) {
        score.reset();
        setup();
      }
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
