
PImage img;

void  setup() {
  img = loadImage("image.jpg");
  
  size(img.width, img.height);
  img.loadPixels();
}

void draw() {
  image(img, 0, 0);
  
  int x = mouseX;
  int y = mouseY;
  
  int arrayPosition = x + (y * img.width);
  fill(img.pixels[arrayPosition]);
  ellipse(x, y, 100, 100);
}
