
int walkersAmount = 10;

ArrayList<Walker> walkers = new ArrayList();

void setup() {
  size(300, 600);
  colorMode(HSB);
  background(0);

  for (int i = 0; i < walkersAmount; i++) {
    walkers.add(new Walker());
  }
}

void draw() { 
  for (int i = 0; i < walkers.size(); i++) {
    Walker walker = walkers.get(i);
    walker.draw();
  }
}

void keyReleased() {
  saveFrame("export/bildname" + hour() + minute() + second() + "-#######.png");
}

