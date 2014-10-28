
class HighlightWalker extends Walker {
  
  int prevX, prevY;
  
  HighlightWalker (int stepSize, int pointSize) {
    super(stepSize, pointSize);
    
    this.prevX = 0;
    this.prevY = 0;
    this.pointColor = color(255, 50);
  }
  
  void update() {
    this.prevX = this.x;
    this.prevY = this.y;
    super.update();
  }
  
  void draw() {
    if (this.isDead) {
      return;
    }
    
    if (this.prevX != this.x && this.prevY != this.y) {
      strokeWeight(this.pointSize);
      stroke(this.pointColor);
      line(this.prevX, this.prevY, this.x, this.y);
    }
    
    this.update();
  }
  
}
