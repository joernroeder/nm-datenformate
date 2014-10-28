void setup() {
  size(300, 600);
  colorMode(HSB);
  background(0);
}

void draw() {
  
}

void keyReleased() {
  saveFrame("export/bildname" + hour() + minute() + second() + "-#######.png");
}

