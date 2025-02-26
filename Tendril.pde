class Tendril {
  public final static int SEG_LENGTH = 4; // Length of each segment
  private int myNumSegments, myX, myY;
  private double myAngle;

  /**
   * Class constructor
   * @param len Number of segments in this tendril
   * @param theta Starting angle in radians
   * @param x, y Starting (x, y) coordinates
   */
  public Tendril(int len, double theta, int x, int y) {
    myNumSegments = len;
    myAngle = theta;
    myX = x;
    myY = y;
  }

  public void show() {
    int startX = myX;
    int startY = myY;

    for (int i = 0; i < myNumSegments; i++) {
      // Wiggle the angle slightly
      myAngle += random(-0.2, 0.2);
      
      // Calculate end position
      int endX = startX + int(cos((float) myAngle) * SEG_LENGTH);
      int endY = startY + int(sin((float) myAngle) * SEG_LENGTH);

      // Change stroke color based on depth
      stroke(lerpColor(color(255, 200, 200), color(255, 0, 0), float(i) / myNumSegments));
      strokeWeight(map(myNumSegments, 3, 50, 1, 4));
      line(startX, startY, endX, endY);

      // Move start position to end position
      startX = endX;
      startY = endY;
    }

    // Recursively create a new Cluster at the tip if it's still long enough
    if (myNumSegments >= 3) {
      new Cluster(startX, startY, myNumSegments / 2);
    }
  }
}
