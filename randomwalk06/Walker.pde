

class Walker {

  int x;
  int y;

  color pointColor;

  int stepSize;
  float pointSize;

  boolean isDead = false;

  Walker (int stepSize, float pointSize) {
    this.stepSize = stepSize;
    this.pointSize = pointSize;
    
    // 1. zufälligen Startpunkt
    this.x = round(random(width));
    this.y = 0;
    // 2. Farbe generieren
    this.pointColor = color(this.randomColor(), this.randomColor(150, 200), 255, this.randomColor());
  }

  void update() {
    this.x = this.updatePoint(this.x, width);
    this.y += round(random(this.stepSize));

    if (this.y > height) {
      this.isDead = true;
    }
  }
  
  void draw() {
    if (this.isDead) {
      return;
    }
    
    strokeWeight(this.pointSize);
    //stroke(frameCount % 255, 255, 255, this.randomColor());
    stroke(this.pointColor);
    point(this.x, this.y);

    this.update();
  }

  int randomColor(int high) {
    return round(random(high));
  }

  int randomColor(int low, int high) {
    return round(random(low, high));
  }


  int randomColor() {
    return round(random(255));
  }

  /*
 * position: position auf der achse
   * maximum: maximum der achse
   */
  int updatePoint(int position, int maximum) {

    int offset;
    float leftOrRight = random(-1, 1);
    int newPosition;

    if (leftOrRight < 0) {
      offset = this.stepSize;
    }
    else {
      offset = -this.stepSize;
    }

    newPosition = position + offset;
    boolean newPositionIsOnStage =this.isOnStage(newPosition, maximum);

    // die neue position ist innerhalb der bühne
    if (newPositionIsOnStage) {
      return newPosition;
    }
    else {
      // außerhalb der bühne -> erneut berechnen
      //return this.updatePoint(position, maximum);
      return this.getOppositePosition(newPosition);
    }
  }

  boolean isOnStage (int position, int maximum) {
    // position ist kleiner als 0 oder größer-gleich maximum
    if (position < 0 || position >= maximum) {
      return false;
    }
    else {
      return true;
    }
  }

  int getOppositePosition (int position) {
    // links nach rechts
    if (position < 0) {
      return width - position;
    }
    // rechts nach links
    else {
      return position - width;
    }
  }
}

