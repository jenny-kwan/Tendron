public class Tendril {
    public final static int SEG_LENGTH = 4;
    private int myNumSegments, myX, myY;
    private double myAngle;

    public Tendril(int len, double theta, int x, int y) {
        myNumSegments = len;
        myAngle = theta;
        myX = x;
        myY = y;
    }

    public void show() {
        float startX = myX;
        float startY = myY;

        stroke(100, 60, 30);
        strokeWeight(map(myNumSegments, 15, 130, 1, 3));

        for (int i = 0; i < myNumSegments; i++) {
            myAngle += random(-0.15, 0.15); // Less randomness for smoother symmetry
            float endX = startX + cos((float) myAngle) * SEG_LENGTH;
            float endY = startY + sin((float) myAngle) * SEG_LENGTH;
            line(startX, startY, endX, endY);
            startX = endX;
            startY = endY;
        }

        if (myNumSegments >= 15) {
            new Cluster((int)(myNumSegments * 0.6), (int)startX, (int)startY);
        } else {
            drawFlower((int)startX, (int)startY); // More flowers at the branch ends
        }
    }

    void drawFlower(int x, int y) {
        fill(255, 120, 180);
        noStroke();
        for (int i = 0; i < 6; i++) {
            float angle = TWO_PI / 6 * i;
            float petalX = x + cos(angle) * 7;
            float petalY = y + sin(angle) * 7;
            ellipse(petalX, petalY, 12, 12);
        }
        fill(255, 220, 0);
        ellipse(x, y, 8, 8);
    }
}
