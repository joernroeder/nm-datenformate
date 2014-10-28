
int walkersAmount = 20;

int minStepSize = 10;
int maxStepSize = 50;

int minPointSize = 2;
int maxPointSize = 5;

ArrayList<Walker> walkers = new ArrayList();

void setup() {
  size(300, 600);
  colorMode(HSB);
  background(0);

  for (int i = 0; i < walkersAmount; i++) {
    addWalker();
  }
}

void draw() {
  // überprüfung nach toten walkers
  for (int i = 0; i < walkers.size(); i++) {
    Walker walker = walkers.get(i);
    if (walker.isDead) {
      walkers.remove(i);
    }
  }
  
  // neue walkers generieren
  for (int i = 0; i < (walkersAmount - walkers.size()); i++) {
    addWalker();
  }
  
  // walkers zeichnen
  for (int i = 0; i < walkers.size(); i++) {
    Walker walker = walkers.get(i);
    walker.draw();
  }
}

void addWalker() {
  int stepSize = round(random(minStepSize, maxStepSize));
  int pointSize = round(random(minPointSize, maxPointSize));
  
  walkers.add(new Walker(stepSize, pointSize));
}

void keyReleased() {
  saveFrame("export/bildname" + hour() + minute() + second() + "-#######.png");
}

