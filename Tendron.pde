void setup() {
    size(500, 500);
    background(207, 233, 255); // Pastel light sky blue 💙☁️
    noLoop();
}

void draw() {
    background(207, 233, 255); // Clears screen before drawing a new Tendron
    new Cluster(60, width / 2, height / 2);
}

void mousePressed() {
    redraw(); // Click to generate a new Tendron
}
