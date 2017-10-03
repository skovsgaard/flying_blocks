BasePlatform platform = new BasePlatform();
Player player = new Player();

void setup() {
  size(900, 500);
  noStroke();
}

void draw() {
  background(25, 25, 140);
  platform.draw();
  player.draw();

  Obstacle currObst = new Obstacle(width - 50, platform.y - 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      player.dodge();
    }
  }
}
