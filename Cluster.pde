public class Cluster {
    public final static int NUM_STEMS = 6; // More symmetry with even spacing
    private int myX, myY, myNumSegments;

    public Cluster(int len, int x, int y) {
        myNumSegments = len;
        myX = x;
        myY = y;

        if (myNumSegments < 15) {  
            drawFlower(myX, myY);  // Flowers appear at smaller branches
            return;  
        }

        for (int i = 0; i < NUM_STEMS; i++) {
            double angle = i * TWO_PI / NUM_STEMS; // Evenly spaced
            Tendril t = new Tendril((int)(myNumSegments * 0.7), angle, myX, myY);
            t.show();
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
