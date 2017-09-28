BasePlatform platform = new BasePlatform();
Player player = new Player();

void setup() {
  size(900, 500);
  noStroke();
}

void draw() {
  background(25, 25, 140);
  platform.draw();
  platform.move();
  player.draw();
}

