String[] slideUrls= {"forest.open.jpg","night.jpg"};
PImage[] slides = new PImage [slideUrls.length];
int slideCounter =0;
PShape star;

void setup() {
  size(800,600,P2D);
  for( int i=0; i<slides.length;i++){
    slides[i]= loadImage(slideUrls[i]);
    
  star = createShape();
   star.beginShape();
   star.fill(102);
   star.stroke(255);
   star.strokeWeight(2);
    star.vertex(0, -50);
  star.vertex(14, -20);
  star.vertex(47, -15);
  star.vertex(23, 7);
  star.vertex(29, 40);
  star.vertex(0, 25);
  star.vertex(-29, 40);
  star.vertex(-23, 7);
  star.vertex(-47, -15);
  star.vertex(-14, -20);
  star.endShape(CLOSE);
  
 

  }
}

void draw() {
  background(0);
  image(slides[slideCounter],0,0);
  
  translate(mouseX,mouseY);
  shape(star);
}

void keyPressed() {
  if (key == ' ') {
    slideCounter++;
    if(slideCounter > slides.length-1) slideCounter=0;
  } else if (key == 'z') {
    slideCounter --;
    if (slideCounter < 0) slideCounter = slides.length-1;
  }
}
