public class Cluster {
    public final static int NUM_STEMS = 7; // Number of tendrils per cluster
    private int myNumSegments, myX, myY;

    /**
     * Constructor for Cluster
     * @param len Number of segments in each tendril
     * @param x, y Starting coordinates
     */
    public Cluster(int len, int x, int y) {
        myNumSegments = len;
        myX = x;
        myY = y;

        // Create 7 tendrils evenly spaced around a full circle (2π radians)
        for (int i = 0; i < NUM_STEMS; i++) {
            double angle = i * TWO_PI / NUM_STEMS; // Evenly space the angles
            Tendril t = new Tendril(myNumSegments, angle, myX, myY);
            t.show();
        }
    }
}
