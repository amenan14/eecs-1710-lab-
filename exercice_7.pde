PShader edges;
PImage img;
boolean enabled = true;

void setup() {
  size(640,360,P2D);
  img= loadImage("wisteria.png");
  edges = loadShader("edges.glsl");
}

void draw() {
  if ( enabled == true) {
    shader(edges);
  }
  image( img,0,0);
}

void mousePressed() {
  enabled = !enabled;
    if (!enabled == true) {
    resetShader();
  }
}
  
