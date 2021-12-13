// inspired by the PixelExemple07 from week 10
Dot player;

PVector spawn;

PImage terrain_test;
PImage lantern;
Lantern b1;
Lantern b2;


void setup() {
  size(800, 600, P2D);
  spawn = new PVector(width/2, 10);
  player = new Dot(spawn.x, spawn.y, color(255, 204, 0), spawn);
  terrain_test = loadImage("terrain_test.png");
  terrain_test.loadPixels();
  
  
   lantern= loadImage("lantern.png");
  
   b1= new Lantern(200,300,128);
   b2= new Lantern(600,300,64);

  // sound used: rhythm amidst the reeds_Genshin impact_original soundtrack
 
 soundfile= new SoundFile(this, "Rhythm.mp3");
  
  reverb = new Reverb(this);
  
  soundfile.loop();
  
  reverb.process(soundfile);
  
}

void draw() { 
  background(0); 
  image(terrain_test, 0, 0);

 
  println(player.position.x + " " + player.position.y);
  int loc = int(player.position.x) + int(player.position.y) * terrain_test.width;
  float b = brightness(terrain_test.pixels[loc]);
  if (b > 200) {
    player.target = spawn.copy();
  }
  println(b);
  player.run();

  surface.setTitle("" + frameRate);
  
  
   imageMode(CORNER);
  image(lantern,100,10,200,0);
  b1.ascend();
  b1.display();
  b1.top();
  
  b2.ascend();
  b2.display();
  b2.top();
  
  
  //signal unprocessed when the mouse is upwards
  float roomSize = map(mouseX,0,width,0,1.0);
  reverb.room(roomSize);
  
  float damping = map(mouseX,0,width,0,1.0);
  reverb.damp(damping);
  
  float effectStrength = map(mouseY,0,height,0,1.0);
  reverb.wet(effectStrength);
  
  
}

void mousePressed() {
  player.target = new PVector(mouseX, mouseY); 
}
