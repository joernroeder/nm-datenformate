
class ImageAnalyser {

  PImage img;
  int gridSize;

  ImageAnalyser (String fileName) {
    this.img = loadImage(fileName);
    this.gridSize = this.ggt(this.img.width, this.img.height);
    this.img.loadPixels();
  }
  
  int getArrayPosition() {
    return frameCount - 1; // round(random(this.img.pixels.length));
  }
  
  int getXFromArrayPosition() {
    int gridPerWidth = (this.img.width /gridSize);
    
    return this.getArrayPosition() % gridPerWidth * this.gridSize;
  }
  
  int getYFromArrayPosition() {
    int gridPerWidth = (this.img.width /gridSize);
    
    return this.getArrayPosition() / gridPerWidth * this.gridSize;
  }
  
  int getArrayPositionFromXAndY(int x, int y) {
    return x + y * this.img.width;
  }

  void draw() {
    int x = this.getXFromArrayPosition();
    int y = this.getYFromArrayPosition();
    int pixelIndex = this.getArrayPositionFromXAndY(x,y);
    
    if (pixelIndex >= this.img.pixels.length) {
      return;
    }

    int x1, y1, x2, y2, x3, y3;
    x1 = x + this.gridSize / 2;
    y1 = y;

    x2 = x;
    y2 = y + this.gridSize;

    x3 = x + this.gridSize;
    y3 = y + this.gridSize;
    
    noStroke();
    fill(this.img.pixels[pixelIndex]);
    //ellipseMode(CORNER);
    //ellipse(x, y, gridSize, gridSize);
    
    if (frameCount % 2 == 0) {
      rect(x, y, this.gridSize, this.gridSize);
    }
    else {
      triangle(x1, y1, x2, y2, x3, y3);
    }
  }

  // @see http://wikis.zum.de/zum/Java/ggT
  int ggt(int zahl1, int zahl2) {
    while (zahl2 != 0) {
      if (zahl1 > zahl2) {
        zahl1 = zahl1 - zahl2;
      } 
      else {
        zahl2 = zahl2 - zahl1;
      }
    }
    return zahl1;
  }
}

