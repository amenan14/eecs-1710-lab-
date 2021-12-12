import peasy.*;

PeasyCam cam;

LetterGenerator lg;
String input = "bcd";
PImage katana;

void setup() {
  size(800, 600, P3D);
  cam = new PeasyCam(this, 600);
  
  katana = loadImage("katana.png");

  lg = new LetterGenerator(input, 0, height/2);
  
}

void draw() {
  translate(-width/2, -height/2);

  background(127);
  lg.run(); 
}
