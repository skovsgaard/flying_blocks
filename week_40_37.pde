BasePlatform platform = new BasePlatform();
Player player = new Player();
Obstacle obstacle = new Obstacle(850, platform.y-50);

void setup() {
  size(900, 500);
  noStroke();
}

void draw() {
  background(25, 25, 140);
  platform.draw();
  player.draw();

  obstacle.move();
  obstacle.draw();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      player.dodge();
    }
  }
}
