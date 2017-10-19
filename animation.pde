class Animation {
  PImage[] images;
  int imageCount;
  int frame;

  // Instantiate an animation with a predefined imagePrefix and a number of
  // images per animation
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    // Load all images used by the animation at construct time,
    // called during setup() to avoid doing it in the draw() loop
    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + str(i + 1) + ".png";
      images[i] = loadImage(filename);
    }
  }

  // Display the animation at the given position
  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
}
