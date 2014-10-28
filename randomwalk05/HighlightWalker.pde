
class HighlightWalker extends Walker {
  
  HighlightWalker (int stepSize, int pointSize) {
    super(stepSize, pointSize);
    
    this.pointColor = color(255, 50);
  }
  
  void draw() {
    if (this.isDead) {
      return;
    }
    
    int x1, x2, y1, y2, x3, y3;
    
    x1 = this.x;
    y1 = round(this.y - this.pointSize);
    
    x2 = this.x - round(this.pointSize / 2);
    y2 = this.y;
    
    x3 = this.x + round(this.pointSize / 2);
    y3 = this.y;
    
    fill(this.pointColor);
    noStroke();
    triangle(x1, y1, x2, y2, x3, y3);
    
    this.update();
  }
  
}
