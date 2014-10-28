

class Walker {

  int x;
  int y;

  int stepSize = 5;
  float pointSize = 5;

  Walker () {
    // 1. zufälligen Startpunkt
    this.x = round(random(width));
    this.y = round(random(height));
    // 2. Farbe generieren
  }

  void draw() {
    strokeWeight(this.pointSize);
    stroke(frameCount % 255, 255, 255, this.randomColor());
    point(this.x, this.y);

    this.x = this.updatePoint(this.x, width);
    this.y = this.updatePoint(this.y, height);
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
      return this.updatePoint(position, maximum);
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
}
