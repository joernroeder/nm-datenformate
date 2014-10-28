
int walkersAmount = 20;

int minStepSize = 10;
int maxStepSize = 50;

int minPointSize = 2;
int maxPointSize = 5;

int highlightWalkerStepSize = 20;
int highlightWalkerPointSize = 4;

ArrayList<Walker> walkers = new ArrayList();
boolean exportEnabled = false;

void setup() {
  size(300, 600);
  colorMode(HSB);
  background(0);

  for (int i = 0; i < walkersAmount; i++) {
    generateWalker(i);
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

  if (exportEnabled && walkers.size() == 0) {
    exportImage();
    exportEnabled = false;
  }
  
  if (!exportEnabled) {
    // neue walkers generieren
    for (int i = 0; i < (walkersAmount - walkers.size()); i++) {
      generateWalker(i);
    }
  }

  // walkers zeichnen
  for (int i = 0; i < walkers.size(); i++) {
    Walker walker = walkers.get(i);
    walker.draw();
  }
}

void generateWalker(int index) {
  if ( index % 10 == 0) {
    addHighlightWalker();
  } 
  else {
    addWalker();
  }
}

void addHighlightWalker() {
  walkers.add(new HighlightWalker(highlightWalkerStepSize, highlightWalkerPointSize));
}

void addWalker() {
  int stepSize = round(random(minStepSize, maxStepSize));
  int pointSize = round(random(minPointSize, maxPointSize));

  walkers.add(new Walker(stepSize, pointSize));
}

void exportImage() {
  saveFrame("export/bildname" + hour() + minute() + second() + "-#######.png");
  println("saved image!");
}

void keyReleased() {
  exportImage();
}

void mousePressed() {
  exportEnabled = !exportEnabled;
  println("export enabled: " + exportEnabled);
}

